Algorithm:

1) Extract batch which will be constrained based on the dates

1.1) Select node c02 ```<unittitle>``` Norddeutscher Bund und Deutsches Reich (1867/1871-1945) ```</unittitle>```

1.2) Select following c03 groups
• Andere politische Parteien und Gruppierungen
• Arbeit, Soziales
• Auswärtiges, Kolonial- und Besatzungsverwaltung
• Bilder, Plakate, Karten, Pläne, Töne
• Finanzen, Bau
• Inneres, Polizei und SS, Volkstum
• Justiz
• Kultus, Wissenschaft, Propaganda
• Oberste Organe
• Organisationen und Verbände
• Wirtschaft, Rüstung, Landwirtschaft, Post, Verkehr

1.3) For groups selected in (1.2) extract all lower levels with level="fonds" and format them as independent EAD files

1.4) Select c03 grup "Militär"

1.5) Select subgroups c04
• Reichswehr und Wehrmacht 1919 bis 1945
• Waffen-SS 1939 bis 1945

1.6) For groups selected in (5) extract all lower levels with level="fonds" and format them as independent EAD files

1.7) Filter the selected data based in the dates of  ```<unitdate encodinganalog="Bestandslaufzeit">```. Dates or date ranges must be included/overlap with NS-rule (1933-1945)

2) Extract batch which won't be constrained based on the dates

2.1) Select c03 grup "Einrichtungen der NSDAP"

2.2) For groups selected in (2.1) extract all lower levels with level="fonds" and format them as independent EAD files

3) Merge extracted batches
