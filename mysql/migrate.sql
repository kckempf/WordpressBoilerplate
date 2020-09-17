UPDATE asb_options
SET
    option_value = replace(option_value, 'oldaddress.com', 'localhost:8000')
WHERE
    option_name = 'home'
OR
    option_name = 'siteurl';

UPDATE asb_posts 
SET 
    guid = replace(guid, 'oldaddress.com','localhost:8000');

UPDATE 
    asb_posts 
SET 
    post_content = replace(post_content, 'oldaddress.com', 'localhost:8000');

UPDATE asb_postmeta 
SET 
    meta_value = replace(meta_value,'oldaddress.com','localhost:8000');
