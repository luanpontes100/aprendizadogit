var Ami = {
    params: {
        url: '{$AMI.URL}'
    },
    api_request: new HttpRequest(),

    request: function (url, action) {
        url += action;
        Zabbix.log(4, '[ Asterisk ] Sending request: ' + url);
        try {
            response = Ami.api_request.get(url);
        } catch (error) {
            Zabbix.log(4, '[ Asterisk ] Get request returned error ' + error);
            throw 'Get request returned error ' + error + '. Check debug log for more information.';
        }
        Zabbix.log(4, '[ Asterisk ] Received response with status code ' +
            Ami.api_request.getStatus() + '\n' + response);

        if (Ami.api_request.getStatus() !== 200) {
            var message = 'Request failed with status code ' + Ami.api_request.getStatus();
            if (response !== null) {
                if (typeof response.message === 'string') {
                    message += ': ' + response.message;
                }
            }

            throw message + ' Check debug log for more information.';
        }

        var match = response.match('Response: (.+)');
        if (match !== null && match[1] !== 'Success' && match[1] !== 'Goodbye' && match[1] !== 'Follows') {
            var responseText = match[1],
                message = 'Request failed with message ' + match[1];

            match = response.match('Message: (.+)');
            if (match !== null && match[1]) {
                var responseMessage = match[1];
                message += ': ' + match[1];
            }
            if (responseText !== 'Error' || responseMessage !== 'No endpoints found') {
                throw message + '. Check debug log for more information.';
            }
        }

        return {
            status: Ami.api_request.getStatus(),
            body: response
        };
    }
};

var asterisk = {
        users: [],
        total: 0
};

function block2Object(text) {
    var parts = [],
        dict = {};

    text = text.replace(/^Output: /gm, '');

    text.split('\n').forEach(function (line) {
        parts = line.split(':');
        if (parts.length > 1) {
            dict[parts.shift().trim()] = parts.join(':').trim();
        }
    })

    return dict;
}

function text2Object(text) {
    var blocks = text.split('\r\n\r\n'),
        arr = [],
        i = 1,
        j = blocks.length - 2;

    for (i; i < j; i++) {
        arr.push(block2Object(blocks[i]));
    }

    return arr;
}

function getRegistry() {
    response = Ami.request(url, 'sipshowregistry');
    elements = text2Object(response.body);
    asterisk.total = elements.length;
    asterisk.users = elements;
}

function escapeChars(str) {
    return str.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&');
}

var cookie = value.match(/mansession_id="([0-9A-z]+)"/);
if (cookie == null) {
    throw 'Cannot find mansession_id with cookie in response.';
}

var url = Ami.params.url.split('?')[0] + '?action=';

Ami.api_request.addHeader('Cookie: mansession_id="' + cookie[1] + '"');

response = Ami.request(url, 'command&command=core%20show%20channels%20concise');
channels = response.body;

response = Ami.request(url, 'ListCommands');
var list = response.body;

if (list.includes('SIPshowregistry')){
    getRegistry();
}

try {
    response = Ami.request(url, 'Logoff');
}
catch (e) {}

return JSON.stringify(asterisk);
