#
# $Id$
#
# Generate the CLR statements.
#
SELECT concat( "B", (
`bank-num` -1
), ",CLR" ) 
FROM `bank-plan` 
JOIN `bank-plan-id-name-map` ON ( `bank-plan-id-name-map`.id = `bank-plan`.`bank-plan-id` ) 
WHERE name = "emsi-10-banks-of-30-slots";
#
# Generate the Trunk Mode statements.
#
SELECT concat( "B", (
`bank-num` -1
), ",TM,na" ) 
FROM `bank-plan` 
JOIN `bank-plan-id-name-map` ON ( `bank-plan-id-name-map`.id = `bank-plan`.`bank-plan-id` ) 
WHERE name = "emsi-10-banks-of-30-slots";
#
# Generate the Bank Tag statements.
#
SELECT concat( "B", (
`bank-num` -1
), ",BT,", `slot-plan-id-name-map`.name ) 
FROM `bank-plan` 
JOIN `bank-plan-id-name-map` ON ( `bank-plan-id-name-map`.id = `bank-plan`.`bank-plan-id` ) 
JOIN `slot-plan-id-name-map` ON ( `slot-plan-id-name-map`.id = `bank-plan`.`slot-plan-id` ) 
WHERE `bank-plan-id-name-map`.name = "emsi-10-banks-of-30-slots";
#
# Generate the CHannel statements.
#
SELECT
   concat
      (
      "B",(`bank-num`-1),
      ",CH,",(`slot-num`-1),
      ",""",
         upper(left(scope,1)),lower(substring(scope,2,2)),
         upper(left(user,1)),lower(substring(user,2,3)),
         channel,
         upper(left(`use`,1)),lower(substring(`use`,2,2)),
      """,",
      round(spectrum.frequency*1000000,-2),
      ",",`modulation`,
      ",",`squelch-code`
      )
FROM `bank-plan` 
   JOIN `bank-plan-id-name-map` ON (`bank-plan-id-name-map`.id = `bank-plan`.`bank-plan-id`) 
   JOIN `slot-plan` ON (`slot-plan`.`slot-plan-id` = `bank-plan`.`slot-plan-id`)
   JOIN spectrum ON (spectrum.frequency = `slot-plan`.frequency AND spectrum.subkey = `slot-plan`.subkey) 
WHERE `bank-plan-id-name-map`.name = "emsi-10-banks-of-30-slots";