select
    id as opportunity_id,
    account_id,
    opportunity_at,
    trim(comment) as comment
from {{ source('crm', 'opportunities') }}
where id is not null
    and account_id is not null
    and opportunity_at is not null
