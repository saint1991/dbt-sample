select
    a.id as account_id,
    a.* exclude (id)
from {{ source('crm', 'accounts') }} as a
where a.id is not null
