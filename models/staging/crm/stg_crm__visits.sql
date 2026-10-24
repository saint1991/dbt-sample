select
    id as visit_id,
    account_id,
    visited_at,
    cast(visited_at as date) as visit_date,
    trim(comment) as comment
from {{ source('crm', 'visits') }}
where id is not null
    and account_id is not null
    and visited_at is not null
