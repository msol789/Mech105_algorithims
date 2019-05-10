%%Matthew Solomon LU Decomp Code
function [L,U,P] = luFactor(A)

%Inputs!
%A will be the Coefficient Matrix
%Outputs!
%L will be the lower Matrix
%U will be the upper matrix
%P will be the pivot Matrix
%if nargin > 1 
    %only one input can be submited for this to run!
    %error('Only one Input allowed!')
%end
%if nargin < 1
    %only one Input Allowed!!
    %error('Only one Input allowed!')
%end 

[x,y]=size(A);
%this allows matlab to quantifiable amounts for the length and height of a
%matrix
if x~=y
    %this insures that the matrix will be a square!
    error('The matrix must be a square matrix')
end 
A1=A;
[x,y]=size(A1);
%First hypothetical for 2x2 matrices 
if x == 2
    %Assignes values for P if no pivoting occurs
    if abs(A1(1,1)) > abs(A1(2,1))
        P=[1,0
            0,1];
    end 
    %re assignes A values and P values if a pivot is neccessary
    if abs(A1(1,1)) < abs(A1(2,1))
        P=[0,1
            1,0];
        Atemp5=A1(2,:);
        A1(2,:)=A1(1,:);
        A1(1,:)=Atemp5;
    end 
    %U5 is the common ratio between the 2nd row and first row in the matrix
    U5=-A1(2,1)/(A1(1,1));
    L=[1,0
        -U5,1];
    %U6 is the new row after being multiplied by U5. The next few lines
    %replace row 2 with U6 to form the final value U
    U6=(A1(1,:)*U5)+A1(2,:);
    A1(2,:)=U6;
    U=A1;
end 
%This next possibility is for 3x3 matrices
    if x == 3 
        %The next if Statements test for the different possibilities of
        %pivoting 
if abs(A1(1,1)) > abs(A1(2,1)) && abs(A1(3,1))
    P=[1 0 0
        0 1 0
        0 0 1];
end
if max(abs(A1(:,1)))== abs(A1(2,1))
    temp=A1(1,:);
    %switches rows for a pivot
    A1(1,:)=A1(2,:);
    A1(2,:)=temp;
    P=[0 1 0
        1 0 0
        0 0 1];
end
%Last possibility for Pivoting 
if max(abs(A1(:,1))) == abs(A1(3,1))
    temp1=A1(1,:);
    A1(1,:)=A1(3,:);
    A1(3,:)=temp1;
    P=[0 0 1
        0 1 0
        1 0 0];
end
%Solves common ratio between the row elements.
%Plugs ratios into desired spots in the L portion of the decomposition
  U1=-(A1(2,1))/A1(1,1);
  A1(2,:)=A1(2,:)+(A1(1,:)*U1);
  U2=-(A1(3,1))/A1(1,1);
  A1(3,:)=A1(3,:)+(A1(1,:)*U2);
  L1=[1,0,0
      -U1,1,0
      -U2,0,1];
  if abs(A1(2,1))> abs(A1(2,2))
      %Takes into account no pivoting 
      P=P;
      L1=L1;
      U1=U1;
  end
  if abs(A1(2,1))< abs(A1(2,2))
      %Pivots elements in the second row while ignoring values in the first
      %row
      temp2=A1(2,:);
    A1(2,:)=A1(3,:);
    A1(3,:)=temp2;
      Ptemp1=P(2,:);
      P(2,:)=P(3,:);
      P(3,:)=Ptemp1;
      %Pivots values in the L column
      Ltemp1=L1(2,1);
      L1(2,1)=L1(3,1);
      L1(3,1)=Ltemp1;
  end
  %Solves for U3, aka, last unknown for L
   U3=-A1(3,2)/A1(2,2);
   %creates new row values
  A1(3,:)=(A1(2,:)*U3)+A1(3,:);
  %substitutes original row with new row
  L1(3,2)=-U3;
  U=A1;
  L=L1;
    end
 if x == 4
     

A1=A;
[x,y]= size(A1);

if x == 4
    
    if max(abs(A1(:,1)))== abs(A1(1,1))
        P=[1,0,0,0
            0,1,0,0
            0,0,1,0
            0,0,0,1];
    end
    if abs(A1(2,1)) == max(abs(A1(:,1)))
        P=[0,1,0,0
            1,0,0,0
            0,0,1,0
            0,0,0,1];
        temp=A1(1,:);
    A1(1,:)=A1(2,:);
    A1(2,:)=temp;
end 
if abs(A1(3,1)) == max(abs(A1(:,1)))
        P=[0,0,1,0
            0,1,0,0
            1,0,0,0
            0,0,0,1];
temp1=A1(1,:);
    A1(1,:)=A1(3,:);
    A1(3,:)=temp1;
end 
if abs(A1(4,1)) == max(abs(A1(:,1)))
        P=[0,0,0,1
            0,1,0,0
            0,0,1,0
            1,0,0,0];
        temp1=A1(1,:);
    A1(1,:)=A1(4,:);
    A1(4,:)=temp1;
end 
U1=-(A1(2,1))/A1(1,1);
  A1(2,:)=A1(2,:)+(A1(1,:)*U1);
  U2=-(A1(3,1))/A1(1,1);
  A1(3,:)=A1(3,:)+(A1(1,:)*U2);
  U3=-(A1(4,1))/A1(1,1);
  A1(4,:)=A1(4,:)+(A1(1,:)*U3);
  L1=[1,0,0,0
      -U1,1,0,0
      -U2,0,1,0
      -U3,0,0,1];
  if(abs(A1(2,2)))> abs(A1(2,3)) && abs(A1(2,4))
          P;
          L1;
          A1;
  if (abs(A1(2,3)))> abs(A1(2,2)) && abs(A1(2,4))
           Ptemp1=P(2,:);
      P(2,:)=P(3,:);
      P(3,:)=Ptemp1;
            Ltemp1=L1(2,1);
      L1(2,1)=L1(3,1);
      L1(3,1)=Ltemp1;
      temp2=A1(2,:);
    A1(2,:)=A1(3,:);
    A1(3,:)=temp2;
  end 
    if (abs(A1(2,4)))> abs(A1(2,2)) && abs(A1(2,3))
        Ptemp1=P(2,:);
      P(2,:)=P(4,:);
      P(4,:)=Ptemp1;
            Ltemp1=L1(2,1);
      L1(2,1)=L1(4,1);
      L1(4,1)=Ltemp1;
      temp2=A1(2,:);
    A1(2,:)=A1(4,:);
    A1(4,:)=temp2;
    end 
       U3=-A1(3,2)/A1(2,2);
       U4=-A1(4,2)/A1(2,2);
        A1(3,:)=(A1(2,:)*U3)+A1(3,:);
        A1(4,:)=(A1(2,:)*U4)+A1(4,:);
  L1(3,2)=-U3;
  L1(4,2)=-U4;
  end
  if abs(A1(3,3)) > abs(A1(3,4))
      P;
      L1;
      A1;
  end   
  if abs(A1(3,3)) < abs(A1(3,4))
       Ptemp1=P(3,:);
      P(3,:)=P(4,:);
      P(4,:)=Ptemp1;
            Ltemp1=L1(4,1);
      L1(4,2)=L1(4,1);
      L1(4,1)=Ltemp1;
      temp2=A1(3,:);
    A1(3,:)=A1(4,:);
    A1(4,:)=temp2;
  end 
  U5=-A1(4,3)/A1(3,3);
  A1(4,:)=(A1(3,:)*U5)+A1(4,:);
   L1(4,3)=-U5;
end 
   L=L1;
   U=A1;
if x > 5
    error(' input is too big')
end 
 end 
 P
 A 
 L
 U
end 
 