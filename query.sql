CREATE VIEW status_duration AS
SELECT
    changelogs.issue_key as issue_key,
    changelogs.author_key as author_key,
    changelogs.from_status as status,
    issues.created_at as start_date,
    changelogs.created_at as end_date,
    EXTRACT(EPOCH FROM changelogs.created_at - issues.created_at)
FROM
    changelogs
INNER JOIN issues
ON changelogs.issue_key = issues.issue_key;
