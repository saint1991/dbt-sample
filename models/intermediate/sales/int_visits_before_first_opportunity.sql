select
    v.*,
    o.first_opportunity_id,
    o.first_opportunity_at
from {{ ref('stg_crm__visits') }} as v
left join {{ ref('int_first_opportunity_by_account') }} as o
    on v.account_id = o.account_id
where o.first_opportunity_at is null
    or v.visited_at <= o.first_opportunity_at
