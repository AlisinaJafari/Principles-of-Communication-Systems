# Computer Assignment 3 - Principles of Commuinication Systems

In this assignment the second half contents of the course will be discussed . There are 3 parts in this project . First one is about statistics specifically Rayliegh destribution . We are going to analyze this destribution and plot its PDF . In the second part , a random process will be argued and the Expectation function and Auto correlation function will be calculated and plotted . and finally in the last part we are going to simulate a digital communication channel .

# PART 1 ( Rayliegh destribution )

After some estimations The PDF of 3 random variables ( X , Y , Z ) are plotted in MATLAB :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/1cc67532-7bf9-47ef-a3b3-d52e8ab0faf1)

Setting the value of N 1000 , we ought to generate 3 arrays of random variables ( using randn function for normal destribution ) and plot them :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/33fa569b-929f-4913-a473-bb32b95b6a26)

And now , the 3 previous plots with the N = 100000 :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/ff2027dc-ad7b-43c5-8ab5-86bf46fd6fee)

Here are the value of the mean and variance of 2 different Ns :

N = 1000  : m = 1.2804  ,  var = 0.4078    ;    N = 100000  :   m = 1.2520  ,  var = 0.4285

It is clear that if the value of N is increased , the histogram would get closer to the PDF .

# PART 2 ( Random process )

According to calculations below , this random process is WSS .

<img width="595" alt="image" src="https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/ff387c45-0c59-45a6-8c5c-88db510c1c1a">

At first we have to define a 101*10000 matrix to generate a unique array of theta for each index of time . After averaging the matrix over theta we have :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/a871f730-91f6-45c6-80e3-7e20895e1c3c)

Now we should define X(t + tau) and X(t) and calculate the product of them and average over theta , after these steps the 3D auto-correlation function is ready to be plotted :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/d49b37cb-dc34-4142-abea-ce87528bfcaa)













