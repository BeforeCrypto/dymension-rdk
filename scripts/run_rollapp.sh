#!/bin/bash
BASEDIR=$(dirname "$0")
. "$BASEDIR"/shared.sh

# If the settlement layer is set to dymension, use $SETTLEMENT_CONFIG otherwise use $SETTLEMENT_CONFIG_MOCK
if [ "$SETTLEMENT_LAYER" = "dymension" ]; then
  SETTLEMENT_CONFIG="$SETTLEMENT_CONFIG"
else
  SETTLEMENT_CONFIG="$SETTLEMENT_CONFIG_MOCK"
fi

# If aggregator is set to true pass the aggregator flag
if [ "$AGGREGATOR" = "true" ]; then
  AGGREGATOR_FLAG="--dymint.aggregator"
else
  AGGREGATOR_FLAG=""
fi

#TODO: make running a mock through a parameter
$EXECUTABLE start $AGGREGATOR_FLAG \
  --dymint.da_layer "mock" \
  --dymint.settlement_layer "$SETTLEMENT_LAYER" \
  --dymint.settlement_config "$SETTLEMENT_CONFIG" \
  --dymint.block_batch_size "$BATCH_SIZE" \
  --dymint.namespace_id "$NAMESPACE_ID" \
  --dymint.block_time "$BLOCK_TIME" \
  --p2p.seeds "$P2P_SEEDS" \
  --home "$CHAIN_DIR" \
  --log_level "$LOG_LEVEL"

