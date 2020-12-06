#!/bin/sh

create()
{
	echo "Please enter a name for your new Address Book"
	read a
	
	#check address book is available 
	res=`ls | grep $a | wc -w` 
	
	if [ $res> 0 ]
	then 
		echo "Error: File is already existing!"
		
	else
		touch $a
		echo "$a Address book created!"
		
	fi
}

display()
{
	echo "Enter the Address Book name"
	read a
	
	#check address book is available 
	res=`ls | grep $a | wc -w` 
	
	if [ $res -gt 0 ]
	then 
		cat $a
		
	else
		echo "Error: File is not existing!"
		
	fi
}


insert()
{
	echo "Enter the Address Book name"
	read a
	
	#check address book is available 
	res=`ls | grep $a | wc -w` 
	
	if [ $res> 0 ]
	then 
		echo "Enter Your Mobile number"
		read mob
		
		#check mobile no. is present or not
		
		len=`cat $a | grep $mob | wc -w`
		if [ $len -gt 0 ]
		then
			echo "Error: Mobile number already existing"
			
		else
			echo "Enter first Name, Last name"
			read fname lname 
			
			record=`echo $fname $lname $mob`
			echo $record >> $a
			echo "Record Inserted"
		fi		 
		
	else
		echo "Error: File is not existing!"
		
	fi
}



modify()
{
	echo "Enter the Address Book name"
	read a
	
	#check address book is available 
	res=`ls | grep $a | wc -w` 
	
	if [ $res -gt  0 ]
	then 
		echo "Enter mobile number"
		read mob
		
		#check mobile no. is present or not
		
		len=`cat $a | grep $mob | wc -w`
		if [ $len -gt 0 ]
		then
			old=`cat $a | grep $mob`
			echo "Enter the modified details as: First Name Last Name Mobile Number"
			read fname lname mob
			
			new=`echo $fname $lname $mob`
			
			echo "OLD: $old"
			echo "NEW: $new"
					
			sed -i s/"$old"/"$new"/g $a
			echo "Record Modified"

			
		else
			echo "Error: Moblile number already existing"

			
		fi		 
		
	else
		echo "Error: File is not existing!"
		
	fi
}

delete()
{
	echo "Enter the Address Book name"
	read a
	
	#check address book is available 
	res=`ls | grep $a | wc -w` 
	
	if [ $res -gt 0 ]
	then 
		echo "Enter Mobile number"
		read mob
		
		#check mobile no. is present or not
		
		len=`cat $a | grep $mob | wc -w`
		if [ $len -gt 0 ]
		then
			
			
			old=`cat $a | grep $mob`
			
					
			sed -i s/"$old"//g $a
			sed -i /^$/d $a
			echo "Record deleted"

			
		else
			echo "Error: Phone number not found"

			
		fi		 
		
	else
		echo "Error: File is not existing!"
		
	fi
}





while [ true ]
do
	echo "-------Menu------"
	echo "1. Create"
	echo "2. Display"
	echo "3. Insert record"
	echo "4. Modify"
	echo "5. Delete"
	echo "6. Exit"
	
	echo "Enter Choice"
	read choice
	
	case $choice in
	
		1) create ;;
		
		2) display ;;
		
		3) insert ;;
		
		4) modify ;;
		
		5)delete ;;
	
		6) exit ;;
	
		*) echo "Wrong Choice!" ;;
	esac
done
