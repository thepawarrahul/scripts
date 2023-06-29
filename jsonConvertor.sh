#!/bin/bash

# Convert Excel to CSV
xlsx2csv input.xlsx > output.csv

# Convert CSV to JSON using jq
cat output.csv | jq -Rn '
  [inputs |
    split(",") |
    {
      username: .[0],
      tags: [{
        oldTag: .[1],
        newTag: .[2]
      }]
    }
  ]' > output.json

# Cleanup
rm output.csv

echo "Conversion completed. JSON file generated: output.json"

