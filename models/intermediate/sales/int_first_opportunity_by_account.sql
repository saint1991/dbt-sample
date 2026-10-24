select
    account_id,
    opportunity_id as first_opportunity_id,
    opportunity_at as first_opportunity_at
from {{ ref('stg_crm__opportunities') }}
qualify row_number() over (
    partition by account_id
    order by opportunity_at asc, opportunity_id asc
) = 1
