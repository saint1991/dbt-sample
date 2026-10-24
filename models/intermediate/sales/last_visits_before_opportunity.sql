select
    account_id,
    visit_id as last_visit_id,
    visited_at as last_visit_at,
    first_opportunity_id,
    first_opportunity_at
from {{ ref('int_visits_before_first_opportunity') }}
qualify row_number() over (
    partition by account_id
    order by visited_at desc, visit_id asc
) = 1
