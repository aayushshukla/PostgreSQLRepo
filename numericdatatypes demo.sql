/*
    NUMERIC 
	-------------------------------------
	    Integers 
		Fixed Point , Floating 

	Integers 
	----------------------------
	    smallint     2 bytes 
		integer      4 bytes
		bigint       8 bytes  (number larger 2 billion )


	Fixed Point Numbers
	----------------------------------
	     numeric (precision , scale )
		 precision  max number of digits to the left and right of decimal point
		 scale      number of digits allowed on right side of decimal point 

		 example :  numeric(5,2)  return 2 digits after the decimal

	Floating point numbers:
	---------------------------
	        real       allow precision to six decimal digit      

			double     allow precision to 15 deciaml points of precision 

*/

create table tb_datatype2
   (
      col_no numeric(10,2),
	  col_real real,
	  col_double double precision
  );

 select * from tb_datatype2

 insert into tb_datatype2 values (1.2,.5,.5),
 (1.2345566,1.2345566,1.2345566),
 (3.1456663636654,3.1456663636654,3.1456663636654) returning *


  insert into tb_datatype2 values (12345678.23,.5,.5)
   