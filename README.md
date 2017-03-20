# Encoding-Thermal-Stimuli-

## Introduction
When touching a hot object, pain sensations are relayed to the spine via A and C sensory nerve fibres (nociceptors). The A nociceptors give rise to a very sharp and well localised pain sensation, providing an assessment of the magnitude and location of the pain. C nocicpetors on the other hand produce a slow, dull and poorly localised pain response, responsible for measuring the extent of tissue damage which can then trigger defensive mechanisms. These signals are modulated in the spinal cord before being sent to the brain to eventually create the pain response that you feel. In this modulation phase, descending control from a part of the braifffn called the periaqueductal grey can inhibit or excite pain responses. This can be beneficial for example in a fight vs. flight scenario whereby inhibiting the pain of an injury could increase the chance of survival. 

How these two types of sensory fibres encode temperature and how this encoding is modulated by descending control is still largely unknown.  Therefore, in this project I attempt to create a linear non-linear Poisson model of spinal neurons with connections from both A and C nociceptors, to investigate how noxious thermal stimuli is encoded and how the encoding is affected by descending control . 

![](https://www.researchgate.net/profile/Isaura_Tavares/publication/239609420/figure/fig1/AS:298546352934916@1448190405446/Figure-1-Schematic-diagram-of-pain-pathways-involved-in-pain-transmission-and.png)

Taken from Isaura Tavares, Isabel Martins; Gene Therapy for Chronic Pain Management; In Gene Therapy - Tools and Potential Applications

## Running the Project
To create and test the model, the main.m script can be called which:
1. Loads the data
2. Classifies the responses
3. Creates a model
4. Tests the model

### Loading Data
For this project I used recorded data of single cell neurons exported from Spike2 software. The relevant sections of the recording are indicated in an Excel spreadsheet which contains information about the file path, spike channel, number of experimental trials and the start and stop positions of each trial. The temperature and voltage channels are assumed to be channels 1 and 3 respectively.  The parseFile function loads the raw data after which the getData function extracts relevant sections.

### Classifying the Responses
For the data used in this project, the firing rates classified into three groups: rising, falling or plateau responses. The createClasses function seperates the responses into one of these classes using the kmeans clustering algorithm. 

### Creating a Model
The modelled firing rate is given by a linear component consisting of the temperature and it's derivative followed by a sigmoid nonlinearity. The model function obtains parameter values using the Matlab function fminsearch, a derivative-free optimiser, which minimises the squared error. 

### Testing the Model
Test data is loaded and classified using the kmeans centroids from before into a rise, fall or plateau response. The Acceptance-Rejection method is then used to generate Poisson spiking and is plotted. 

## Other tools
The tools folder contains functions to visualise the data. e.g. Spike triggered average, PSTH, Spike-time interval histogram and more. The images folder contains various plots of the model.   

