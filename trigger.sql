CREATE TRIGGER change_messenger AFTER INSERT 
ON messengers FOR EACH ROW
EXECUTE PROCEDURE
change_messenger_f();



CREATE OR REPLACE FUNCTION change_messenger_f()
RETURNS trigger AS $$
begin
    IF (EXISTS(select * from messengers as me where me.id = NEW.id and me.disable_contact_after_answer = 'true')) THEN
        update messengers set disable_contact_after_answer = 'false' where id = NEW.id;
    END IF;
    return NEW;
END;
$$ LANGUAGE plpgsql;