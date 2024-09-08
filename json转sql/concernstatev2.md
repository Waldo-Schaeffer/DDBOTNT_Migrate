INSERT INTO `concernstatev2` (`group_id`, `uid`, `push_mode`, `at_all`, `at_someone`, `filter_not_type`, `offline_notify`, `title_change_notify`)
SELECT 
  c.group_id,
  c.uid,
  s.push_mode,
  JSON_UNQUOTE(JSON_EXTRACT(c.config, '$.group_concern_at.at_all')),
  JSON_EXTRACT(c.config, '$.group_concern_at.at_someone'),
  JSON_EXTRACT(c.config, '$.group_concern_filter.config'),
  JSON_UNQUOTE(JSON_EXTRACT(c.config, '$.group_concern_notify.offline_notify')),
  JSON_UNQUOTE(JSON_EXTRACT(c.config, '$.group_concern_notify.title_change_notify'))
FROM concernconfig c
JOIN concernstate s ON c.group_id = s.group_id AND c.uid = s.uid;

UPDATE `concernstatev2`
SET `filter_not_type` = NULL
WHERE `filter_not_type` = '';

UPDATE `concernstatev2`
SET `at_someone` = NULL
WHERE JSON_TYPE(`at_someone`) = 'NULL';

#以下SQL有问题但是我不会改，你们自己看着办
UPDATE `concernstatev2`
SET `filter_not_type` = JSON_UNQUOTE(JSON_EXTRACT('{"type":["转发"]}', '$.type'))
WHERE `filter_not_type` IS NOT NULL;

