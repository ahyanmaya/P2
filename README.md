# ATHENA: Synthetic Stimulus Evolution and CNN Receptive Field Analysis

Official Code Base for the ATHENA framework for neural representation
analysis in deep neural networks.



## Overview

ATHENA is a MATLAB framework designed to analyze representations in
convolutional neural networks using:

-   Synthetic stimulus evolution
-   Receptive field mapping
-   Image feature statistics
-   Network lesion experiments

The framework allows researchers to evolve images that maximize CNN unit
activations and analyze the structure of the resulting stimuli.

ATHENA is intended for **computational neuroscience and deep learning
interpretability research**.



# Data Processing Flow

Typical ATHENA experiment pipeline:

Deep Neural Network\
↓\
Select layer / unit\
↓\
Synthetic stimulus generator\
↓\
Evolutionary optimization\
↓\
Maximally activating stimuli\
↓\
Image statistics analysis\
↓\
Receptive field mapping\
↓\
Population / layer comparisons



# Dataset Structure

Datasets can be stored either as MATLAB `.mat` files or image folders.

Example structure:

datasets/ - natural_images/ - synthetic_images/ - gabor_bank/ -
ecoset_augmented/

Some analyses require access to the full set of evolved stimuli images
generated during experiments.


# Code Structure

The ATHENA code base is written primarily in **MATLAB**.

Main modules:

Evolution - ATHENA_EvolveSyntheticStimuli.m -
ATHENAN_DualThreadEvolution.m

Receptive Field Analysis - AnalyzeReceptiveFieldsWithGradients.m -
AnalyzeReceptiveFieldsWithArithmetic.m -
AnalyzeReceptiveFieldsWithApertures.m -
ATHENA_AnalyzeReceptiveFields_main_script.m

Image Statistics - ATHENAN_calculateTexture.m -
ATHENAN_calculateSymmetry.m -
ATHENAN_calculateSpatialFrequencyContent.m -
ATHENAN_calculateRMSContrast.m - ATHENAN_calculateColorDistribution.m

Network Tools - ATHENA_GetNetworkByName.m - ATHENA_WeightLesioning.m -
ATHENA_StrongestInputs.m

Datasets - ATHENA_CreateDatasets.m - ATHENAN_returnAugmented_EcoSet.m -
ATHENA_GenerateGaborDatabank.m

Utilities - ATHENAN_findCenterUnitIndexInActivation.m -
ATHENAN_findLastNonLinearLayer.m -
ATHENAN_extractNumericalValuesFromFilenames.m



# Deep Neural Networks

Networks are loaded using:

ATHENA_GetNetworkByName.m

Supported architectures depend on the MATLAB Deep Learning Toolbox and
may include:

-   AlexNet
-   VGG
-   ResNet
-   Custom CNN models


# Stimulus Evolution

Synthetic stimuli are generated using evolutionary optimization.

Key scripts:

-   ATHENA_EvolveSyntheticStimuli.m
-   ATHENAN_DualThreadEvolution.m

Evolution pipeline:

latent vector → generator → CNN → activation score → optimizer update

Images evolve over generations until neuron activation is maximized.


# Dual Generator Evolution

ATHENA supports dual-generator optimization.

Generators may include:

-   FC6 generator
-   GAN-based generators

Script:

ATHENAN_DualThreadEvolution.m

This allows comparison between different generative priors.



# Receptive Field Analysis

Scripts:

-   AnalyzeReceptiveFieldsWithGradients.m
-   AnalyzeReceptiveFieldsWithArithmetic.m
-   AnalyzeReceptiveFieldsWithApertures.m

Methods:

Gradient-based RF mapping\
Arithmetic probing\
Aperture probing

These methods estimate where a CNN neuron is spatially sensitive.



# Image Feature Statistics

Available metrics:

-   Entropy
-   Symmetry
-   Spatial frequency content
-   Luminance
-   RMS contrast
-   Texture statistics
-   Shape statistics
-   Color distribution
-   Image sharpness

Key functions include:

-   ATHENAN_calculate_entropies.m
-   ATHENAN_calculateTexture.m
-   ATHENAN_calculateSymmetry.m
-   ATHENAN_calculateSpatialFrequencyContent.m
-   ATHENAN_calculateRMSContrast.m
-   ATHENAN_calculateColorDistribution.m
-   ATHENAN_calculate_image_sharpness.m

These allow quantitative comparison between evolved stimuli and natural
images.



# Network Lesion Experiments

ATHENA includes tools for weight lesion experiments.

Scripts:

-   ATHENA_WeightLesioning.m
-   ATHENA_Notebook_Lesions.m
-   ATHENA_StrongestInputs.m

These experiments measure:

-   sensitivity to weight perturbations
-   neuron importance
-   robustness of learned representations



# Requirements

Required toolboxes:

-   Deep Learning Toolbox
-   Image Processing Toolbox
-   Statistics and Machine Learning Toolbox

Optional:

-   Parallel Computing Toolbox





# Example Usage

Run a stimulus evolution experiment:

net = ATHENA_GetNetworkByName('alexnet'); layer = 'conv5'; unit = 10;

ATHENA_EvolveSyntheticStimuli(net, layer, unit);

Run receptive field analysis:

ATHENA_AnalyzeReceptiveFields_main_script




