#! /bin/bash


cd ../..

TEST_NAME=$(date +%Y%m%d_%H%M)


python -u random-test.py --queue $1 \
--test-name $TEST_NAME \
--tests 1 \
--run-minutes 10 \
--grace-period-sec 300 \
--in-flight-max 1000 \
--sequences 1 \
--cluster 3 \
--publishers 1 \
--consumers 1 \
--queue-type quorum \
--chaos-actions true \
--chaos-mode partitions \
--chaos-min-interval 30 \
--chaos-min-interval 90 \
--consumer-actions false \
--sac false \
--new-cluster true 2>&1 | tee logs/$TEST_NAME/test_run.log