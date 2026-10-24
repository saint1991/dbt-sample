select
    a.*,
    v.last_visit_id,
    v.last_visit_at,
    o.first_opportunity_id,
    o.first_opportunity_at,
    v.last_visit_id is not null
        and o.first_opportunity_id is not null as has_converted
from {{ ref('stg_crm__accounts') }} as a
left join {{ ref('last_visits_before_opportunity') }} as v
    on a.account_id = v.account_id
left join {{ ref('int_first_opportunity_by_account') }} as o
    on a.account_id = o.account_id
