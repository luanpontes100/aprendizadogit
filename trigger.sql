CREATE TRIGGER change_messenger AFTER INSERT 
ON messengers FOR EACH ROW
EXECUTE PROCEDURE
change_messenger_f();

Versão 1

CREATE OR REPLACE FUNCTION change_messenger_f()
RETURNS trigger AS $$
begin
	IF (EXISTS(select access_number from access_numbers as an where an.access_number = NEW.destination and an.entity_type = 'uras')) THEN
		IF (EXISTS(select * from messengers as me where me.id = NEW.id and me.type='collection_robot')) THEN
			null;
		ELSE
 		update messengers set type = 'reverse_ivr' where id = NEW.id;
 		END IF;
 	ELSIF (NOT EXISTS(select access_number from access_numbers as an where an.access_number = NEW.destination)) THEN
 		 IF (EXISTS(select audio_before_tts_id
audio_after_tts_id
audio_tts from messengers as me where me.id = NEW.id and me.audio_before_tts_id is not null)) THEN
 		 	update messengers set type = 'messenger' where id = NEW.id;
 		 ELSE
 		 	update messengers set type = 'classifier' where id = NEW.id;
 		 END IF;
 	END IF;
 	return NEW;
END;
$$ LANGUAGE plpgsql;



Versão 2

CREATE OR REPLACE FUNCTION change_messenger_f()
RETURNS trigger AS $$
begin
	IF (EXISTS(select * from messengers as me where me.id = NEW.id and (me.audio_before_tts_id is not null or me.audio_tts is not null or me.audio_after_tts_id is not null))) THEN
 		update messengers set type = 'messenger' where id = NEW.id;
 	ELSEIF (EXISTS(select * from messengers as me where me.id = NEW.id and (me.audio_before_tts_id is null and me.audio_tts is null and me.audio_after_tts_id is null and me.destination is null))) THEN
 		update messengers set type = 'classifier' where id = NEW.id;
 	ELSEIF (EXISTS(select access_number from access_numbers as an where an.access_number = NEW.destination and an.entity_type = 'uras')) THEN
 		IF (EXISTS(select * from messengers as me where me.id = NEW.id and me.type != 'dialer_power')) THEN
			null;
		ELSE
 			update messengers set type = 'reverse_ivr' where id = NEW.id;
 		END IF;
 	ELSE
 		NULL;
 	END IF;
 	return NEW;
END;
$$ LANGUAGE plpgsql;
