## Build a Conceptual Data Modeling

### Notes and Changes to be made:
-Fix classes that are redundant. 
-Associate Doctor, Nurse Practitioner, Tablet, Pill, Topical or Liquid to other class 
-Change medication to a simple association of manufacturers 
-Not all the manufacturers make the same medication, so the multiplicity near the aggregation needs to be would be 0..* 3. 
-Add Batch Number attribute,important part of the tracking process. 4. 
-We get a prescription from a physician/prescriber, clarify this
