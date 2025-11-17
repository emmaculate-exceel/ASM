# Processors

  * Processor operations mostly involve processing data. This data can be stored in memory and accessed from thereon. However, reading data from and storing data into memory slows down the processor, as it involves complicated processes of sending data request across the control bus and into the memory storage unit and getting the data through the same channel

  * To speed up the processor operations, the processor includes some internal memory storage locations, called registers

  * The registers stores data element for processing without having to access the memory. A limited number of registers are built into the processors chip.

## Processors registers


   * There are ten 32-bit and six 16-bit processor registers in IA-32 architecture. The registers are grouped in to 3 categories.

   * General registers.
   * Control registers, and
   * Segment registers.


## Data registers

   * Four 32-bit data registers are used for arithmetic, logical, and operations. These 32-bit registers can be used in 3 ways

   	 * As a complete 32-bit registers can be useed as four 16-bit data registers: AX, BX, CX and DX.

	 * Lower and higher halves of the above-mentioned four 16-bit data registers can be used as eight 8-bit data registers: AH, AL, BH, BL, CH, CL, DH, DL.