/*
Enter your query below.
Please append a semicolon ";" at the end of the query
*/
select
    ct.city_name as CityName,
    pd.product_name as ProductName,
    round(sum(ii.line_total_price), 2) as AmountSpent
from city ct
    inner join customer ctm
        on ct.id = ctm.city_id
    inner join invoice iv
        on ctm.id = iv.customer_id
    inner join invoice_item ii
        on iv.id = ii.invoice_id
    inner join product pd
        on ii.product_id = pd.id
group by
    CityName,
    ProductName
order BY
    AmountSpent desc,
    CityName,
    ProductName