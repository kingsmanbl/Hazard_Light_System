# Hazard_Light_System
For this project, I was given the prompt of The landing lights at Sea-Tac are busted, so we have to come up with a new set. In order to show pilots the wind direction across the runways we will build special wind indicators to put at the ends of all runways at Sea-Tac.
Your circuit will be given two inputs (SW[0] and SW[1]), which indicates wind direction, and three lights to display the corresponding sequence of lights: Your circuit must also have a reset signal, that resets the machine to whatever state you choose, when key[0] is pressed (i.e. if you
hold the button down, the machine stays in that state).

SW[1] SW[0] Meaning Pattern(LEDR[2:0])
0 0 Calm 1 0 1
         0 1 0
0 1 Right to Left 0 0 1
                  0 1 0
                  1 0 0
1 0 Left to Right 1 0 0
                  0 1 0
                  0 0 1

For each situation, the lights should cycle through the given pattern. Thus, if the wind is calm,
the lights will cycle between the outside lights lit, and the center light lit, over and over. The
right to left and left to right crosswind indicators repeatedly cycle through three patterns each,
which has the light “move” from right to left or left to rightrespectively.
The switches will never both be true. The switches may be changed at any point during the
current cycling of the lights, and the lights must switch over to the new pattern as soon as
possible (however, it can enter into any point in the other pattern’s behaviors).

Through this project, I was able to recreate the Hazard Light System and ensure 100% functionality as given by the prompt using DE1_SoC. I designed the system by drawing FSM state diagrams and also verified my design using testbenches through ModelSim. 

For all the other projects, I will not be putting on the files that Quartus automatically generates when runs. If you want to run my project, you can download the .sv file and run it on Quartus in your own environment.
