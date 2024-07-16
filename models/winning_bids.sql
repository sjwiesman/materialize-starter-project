{{ config(materialized='view', indexes=[{'columns': ['id']}]) }}

SELECT DISTINCT ON (auctions.id) bids.*,
    auctions.item,
    auctions.seller
  FROM auctions, bids
  WHERE auctions.id = bids.auction_id
  -- Where all bids occurred during the auction
    AND bids.bid_time < auctions.end_time
  -- Where all auctions have completed
    AND mz_now() >= auctions.end_time
  ORDER BY auctions.id,
    bids.amount DESC,
    bids.bid_time,
    bids.buyer;