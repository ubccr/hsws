## elemental-data.csv

### A data set containing information about pure elements.

- **Symbol**: The shorthand for an element name.

- **Atomic Number**: The number of protons in the nucleus of an atom.

- **Atomic Weight**: The mass of an atom. Has units of g/mol.

- **Atomic Radius**: The average distance from the center of the atom to the edge of the electron cloud. Has units of Angstroms (10^-10 m).

- **Covalent Radius**: The size of the atom when forming a covalent bond with another atom. Has units of Angstroms.

- **Valence Electrons**: The number of electrons in the outermost shell of the atom.

- **Density**: The mass per unit volume of a material. Has units of gramss per cubic centimeter (g/cm^3).

- **Electronegativity**: The tendency of an atom to attract electrons.

- **Melting Point**: The temperature at which the element changes state from solid to liquid at atmospheric pressure. Is measured in kelvin (K).

- **Boiling Point**: The temperature at which the element changes state from liquid to vapor at atmospheric pressure. Is measured in kelvin (K).

- **Heat Capacity**: The required amount of energy to raise an object of unit amount in moles by a given temperature. Has units of joules per moles per degrees (J/(mol\*K)).

- **Specific Heat**: The required amount of energy to raise an object of unit mass by a given temperature. Has units of joules per gram per degrees (J/(g\*K)).

- **Heat of Fusion**: The amount of energy required to change the state of a material from solid to liquid, without raising the temperature. Has units of joules per mole (J/mol).

- **Heat of Vaporization**: The amount of energy required to change the state of a material from liquid to vapor, without raising the temperature. Has units of joules per mole (J/mol).

- **Thermal Conductivity**: The measure of how well a material can conduct heat. Has units of watts per meter-kelvin (W/(cm\*K)).

- **Electrical Conductivity**: The measure of how well a material can conduct electricity. Has units of 10^6/(cm ohm).

- **First Ionization Potential**: The required energy to remove a single electron from the atom. Has units of electron volts (eV).

- **Metal Classification**: The major category which an element falls under, determined by shared physical and chemical properties. 

- **Bulk modulus**: A measure of the strength of a material. Indicates how much a material decreases in size when a given pressure is applied to it. Has units of gigapascal (GPa), which is Pa\*10^6.

- **Shear modulus**: A measure of the stiffness of a material. Indicates how much a material will deform when a force is applied parallel to the surface. Has units of GPa. 

- **Toxic**: Whether an element is highly toxic and potentially hazardous.

- **Radioactive**: Whether an element is highly radioactive and potentially hazardous.

- **Price**: Rough cost of a material. Has units of $/kg. 



## compound-data.csv

### A data set containing information about two-element compounds used to make disk drives.

- **A/B**: The symbols of the two elements used in the compounds.

- **Maximum Temperature**: The highest temperature which the compound can withstand before its properties are altered. Has units of K.

- **Saturation Magnetization**: The amount of magnetic force the material can withstand without having its properties changes. Measured in [Teslas](https://en.wikipedia.org/wiki/Saturation_(magnetic))

- **Contains RE**: Whether or not a compound contains a rare earth element.

- **Contains Toxic**: Whether or not a compound contains a toxic element.



## material-toxicity.csv

### A data set containing information on metal oxide nanoparticles used in medical applications.

- **Oxide nanoparticle**: The type of metal oxide nanoparticle.

- **Toxicity**: The cytotoxicity, or damage that the material can do to a living cell. Has units of log(1/EC50). EC50 is the effective concentration of a drug or toxin that causes a response halfway between the baseline and maximum, after a given exposure time. When testing the toxicity on a population of cells, the maximum response is the deaths of all cells; therefore, the EC50 is the concentration of metal nanoparticles at which half of the cells died within a set time. A smaller EC50 concentration will yield a larger value of log(1/EC50), so the smaller a dose required, the more toxic the nanoparticle is.

- **is.toxic**: Whether or not a metal oxide is toxic to humans, based on materials safety data.



## battery-data.csv

### A data set containing information about two-element compounds used to make batteries.

- **A/B**: The symbols of the two elements used in the compounds.

- **Average Output Voltage**: The difference in electric potential energy between two points. This changes as the battery discharges, so the average output voltage is the averaged value of the electric potential difference over the lifetime of the battery. Has units of volts (V).

- **Capacity**: The amount of electric charge a battery can deliver at the rated voltage. Has units of amp-hours (A\*h). 



## tialx-properties.csv

### A data set containing information about Ti-Al-X alloys used to make car frames.

- **X**: The third element added to the 50% Ti-45% Al-5% X alloy, given by the element symbol.

- **Alloy Strength**: The bulk modulus of the alloy material. Has units of GPa.

- **Alloy Toughness**: The amount of energy the alloy can absorb before fracturing. Has units of GPa. 

- **Alloy Density**: The mass per unit volume of the alloy. Has units of g/cm^3.
