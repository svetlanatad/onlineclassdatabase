# Functional Dependencies , Student
A := StudentID
B := FirstName
C := LastName
D := Email

A->B, C, D, E 

# Functional Dependencies , Teachers
F := TeacherID 
B := FirstName
C := LastName
D := Email

F -> B, C, D 

# Functional Dependencies, Enrollments

G := Enrollment_ID
A := Student_ID 
H := Class_ID 
I := enrollment_Date

G -> A, H, I 
A, H -> I 

# Functional Dependencies, Classes
 
H := Class_ID 
F := TeacherID 
J := Class_name
K := Description 

H -> F, J, K 

# Functional Dependencies, Assignments 

L := assigndemnt_ID 
H := class_ID 
M := due_date 
N := assignment_titel 
O := description 

L -> H, M, N, O 

# Functional Dependencies, Addresses

P := address_id
Q := street_address
R := zipcode 
S := state
T := prefecture 
U := city 

P -> Q; R, S, T, U 


Now to check, First normal form is when all attributes are atomic and tables do
not have repeating groups, it is in first normal form 

SecondNormal form analysis 
All non prime attributes need to be fuly dependant on the entire primary key and thats it 
for each table 
A is the PK, all attrs depend on A 
F is the PK, all attrs depend on F 
G is the Pk, all attrs depend on G 
H is the PK, all attrs depend on H 
L is the pK, all attrs depend on L 
P is the pk, all attrs depend on P 
end 
already in 2NF 

Check for 3NF 

no transitive dependencies 

Students: none detected
Teachers: none detected
Enrollments: A,D -> I implies that G -> a, h, i; none detected
classes: none detected 
assignments: none detected 
addresses: none detected 

Check for BCNF 
All func deps need to have at least pk there 
check for each: done, everything has at least one candidatekey, is already in bcnf 

Check for 4NF 
no multi value dependecies 
Students: b c d e depend only on a, none detected 
teachers:  ^ ........  none deteced
classes:  ^ ........  none deteced
assignments:  ^ ........  none deteced
adrdeses:  ^ ........  none deteced

is in 4NF 

Database is normalized complete

