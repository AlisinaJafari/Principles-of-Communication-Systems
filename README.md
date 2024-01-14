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

In this part we need to compare these plots to the theoretical results . so the functions of E(x) and R(x) were plotted :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/42323999-4975-40fd-b440-dab265b7dcf4)

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/238f6933-dad6-48f0-bb6b-1e2b1640c80c)

As we observed , the plots are approximately the same . And by increasing the N , the plots will be much more similar .

By averaging over t , the result will be :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/e726472b-784c-4959-ab6b-1dbed4a7a008)

Obviously , these 2 plots are the same .There is no dependency to the variable t ,therfore the process is WSS .

# PART 3 ( Introduction to the digital communication )

First of all , I defined the m signal as it was mentioned in the project . (N = 50000)

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/b5e8dc0c-5424-4059-83cb-5e9f3578ff14)

Secondly we are asked to sample the signal by f = 500 Hz .

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/9c6d6280-f817-4f3b-9b60-ebf0a666482e)

The next step is quantization . Accordingly we have to define 32 level of quantization .

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/d0141b25-1b11-46b3-b65e-2e9dfd882e08)

Now we have to digitalize the signal . For this purpose , a pulse signal is given ( which the energy of this pulse is 333.334 ) and we should send a pulse with an amplitude between -31 to 31 as each Index of the quantized signal . 

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/6446d424-07f8-4771-9e3c-8b2aace79522)

In the next part we are going to estimate the power of noise Using these relations :

<img width="508" alt="image" src="https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/e28e78a3-f75a-487e-a2c5-4d89bcfa5a71">

And the input of reciever will be like this :

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/61047478-d084-43fc-a005-1e1510b5e25a)

Now we have to decode the signal . Therfore we have to calculate the product of each pulse with the base pulse and after that we are able to decode the message signal .

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/e57aafab-358a-4fc6-a1c4-d51517889ef4)

Finally we have to calculate the error and BER .

![image](https://github.com/AlisinaJafari/Principles-of-Communication-Systems/assets/156543672/246b4e77-b75c-4cc7-a607-acd5aec06f41)
