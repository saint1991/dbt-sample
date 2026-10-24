select
    industry,
    count(*) as visited_account_count,
    count(*) filter (where has_converted) as converted_account_count,
    1.0 * count(*) filter (where has_converted)
        / nullif(count(*), 0) as conversion_rate
from {{ ref('accounts') }}
where last_visit_at is not null
group by industry
order by industry
