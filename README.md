# alsp_classifier
What is Adult-Onset Leukoencephalopathy with axonal spheroids and pigmented glia (ALSP)

ALSP is an infrequent condition of uncertain global prevalence and lacks a current treatment (1). The disease primarily manifests as the degeneration of white matter in the frontal and parietal lobes as well as the corpus callosum, while sparing the temporal lobes (2). ALSP presents a diverse array of symptoms across various domains, including cognitive decline with executive dysfunction, psychiatric manifestations like depression, and motor deficits (3). This broad spectrum of nonspecific symptoms poses challenges for accurate ALSP diagnosis, often leading to misidentification as other conditions such as Alzheimer's disease or Multiple Sclerosis (4).

Touchscreen Operant Platform

	The Touchscreen Operant Platform is specifically crafted to evaluate diverse aspects of executive function, encompassing cognitive flexibility and attention. Its operational methods and task designs make it adaptable for use in both human subjects and experimental models (5).
Meanwhile, the Rodent Continuous Performance Task enables researchers to evaluate different cognitive elements, such as sustained attention, selective attention, reaction time, and impulse control. The mouse CPT provides a range of task probes and allows customization of task parameters to adjust the attentional load. Further information regarding the protocol can be found elsewhere (6).

Significance of the code

	This pipeline serves as a diagnostic tool utilizing CPT data. Both the Logistic Regression and Random Forest algorithms utilize different performance metrics from the task to predict the genotype of each animal, distinguishing between animals that are wild type (with no discernible phenotype) and those that are heterozygous for a crucial gene associated with the ALSP phenotype. The primary objective of this code is to fine-tune models using grid search with cross-validation, conduct feature selection, and assess the models' performance using accuracy metrics. The iterative feature removal process aims to refine model accuracy.

1Papapetropoulos, Spyros, et al. "Adult-onset leukoencephalopathy with axonal spheroids and pigmented glia: review of clinical manifestations as foundations for therapeutic development." Frontiers in Neurology 12 (2022): 788168.
2Konno, Takuya, et al. "CSF1R-related leukoencephalopathy: a major player in primary microgliopathies." Neurology 91.24 (2018): 1092-1104.
3Konno, T., et al. "Clinical and genetic characterization of adult‐onset leukoencephalopathy with axonal spheroids and pigmented glia associated with CSF 1R mutation." European journal of neurology 24.1 (2017): 37-45.
4Meier, Andreas, et al. "Adult-onset leukoencephalopathy with axonal spheroids and pigmented glia (ALSP) is commonly misdiagnosed as Frontotemporal Dementia (FTD), Multiple Sclerosis (MS,) Alzheimer’s disease (AD), or other adult-onset leukodystrophies (P12-4.003)." (2023).
5Horner, Alexa E., et al. "The touchscreen operant platform for testing learning and memory in rats and mice." Nature protocols 8.10 (2013): 1961-1984.
6https://touchscreencognition.org/wp-content/uploads/2021/05/iCPT-v2-Protocol-2021.pdf


