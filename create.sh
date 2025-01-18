#!/bin/env bash
set -e
NOW=$(date -u +'%Y-%m-%d %T')
TEMPLATE_FILE='PROOF-template.txt'
PROOF_FILE='PROOF-signed.txt'

# Replace `$date` with the current date
FORMATTED=$(sed "s/\$date/$NOW/" $TEMPLATE_FILE)
mv $PROOF_FILE $PROOF_FILE.old 2>/dev/null || true
gpg -u me@nexy7574.co.uk --clearsign --output $PROOF_FILE <(echo "$FORMATTED")
cp $PROOF_FILE index.txt
git add index.txt $PROOF_FILE
git commit -S -m "Update proof: $NOW"
