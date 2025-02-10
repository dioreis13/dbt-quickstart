select
    ID as payment_id,
	ORDERID ,
	PAYMENTMETHOD ,
	STATUS ,
	AMOUNT ,
	CREATED 

from {{ source('stripe', 'payment') }}