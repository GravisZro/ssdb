# Original File
[SSDB_Raw_Data.xlsx](SSDB_Raw_Data.xlsx) - Raw data downloaded from: www.chds.us/ssdb

# Generating JSON Data Files
Libreoffice 7.2 or later is required.
Execute export/conversion script via `sh export.sh`

# Generated Files
[headers.json](headers.json) - Field names for all the tables.

[incident.json](incident.json) - Incident Table: Incident ID number and the details of what, where, and when the shooting happened.

[shooter.json](shooter.json) - Shooter Table: Incident ID number and details about the shooter. Multiple rows have the same incident ID number if there were multiple shooters.

[victim.json](victim.json) - Victim Table: Incident ID number and details about the victim. Multiple rows have the same incident ID number if there were multiple victims.

[weapon.json](weapon.json) - Weapon Table: Incident ID number and details about the weapon used (including weapons that were possessed by the shooter during the incident but were not fired). Multiple rows have the same incident ID number if there were multiple weapons used.
