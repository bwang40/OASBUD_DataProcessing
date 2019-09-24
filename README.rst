
**************************************************************************
OASBUD-Ultrasonic Image for Breast Lesions Detection and Characterization
**************************************************************************

.. contents:: Table of Contents
   :depth: 1
   
Introduction
===================
Breast cancer is the most common cancer in women. According to a report by the World Health Organization (WHO), 0.5 million women die of breast cancer each year. The Open Access Series of Breast Ultrasonic Data (`OASBUD <https://zenodo.org/record/545928#.XYp6mShKi9w>`_), presented in is a set of RF signals which were recorded from breast lesions and are now freely available for studying the specificity of the ultrasonic backscattered echoes from malignant and benign breast masses. 

.. image:: https://github.com/bwang40/OASBUD_DataProcessing/blob/master/image/rf_roi_plot.png
   :scale: 25

Background Knowledges
===========================

BI-RADS Score
=====================
Doctors use the BI-RADS system to place abnormal findings into categories. The categories are from 0 to 6. This information is acquired from https://www.healthline.com/health/birads-score


Category 0
---------------
A score of 0 indicates an incomplete test. The mammogram images may have been difficult to read or interpret. In some cases, doctors may want to compare these new images with older ones to determine if there’ve been any changes. A BI-RADS score of 0 requires additional tests and images to provide a final assessment.

Category 1
----------------
This score confirms that your mammogram results are negative. A score of 1 shows that there’s no cancer and your breasts are of equal density. However, it’s important to continue having routine screenings.

Category 2
----------------
A BI-RADS score of 2 also shows that your mammogram results are normal. There are no indications of cancer, but the doctor may notice some benign cysts or masses to include in your report. Routine visits are suggested with this score. The note on your report will be used as a comparison for any future findings.

Category 3
----------------
A score of 3 implies that your mammogram results are probably normal, but there’s a 2 percent chance of cancer. In this case, doctors recommend a follow-up visit within six months to prove the findings are benign. You’ll also need to have regular visits until your results improve and any abnormalities have stabilized. Regular visits help avoid multiple and unnecessary biopsies. They also help confirm an early diagnosis if cancer is found.

Category 4
-----------------
A category 4 score indicates a suspicious finding or abnormality. In this instance, there is a 20 to 35 percent chance of cancer. To confirm, your doctor will need to perform a biopsy to test a small tissue sample.

This score is split within three additional categories based on the doctor’s level of suspicion:

  - 4A. Low suspicion for cancer or malignant findings.
  - 4B. Moderate suspicion for cancer or malignant findings.
  - 4C. High suspicion for cancerous or malignant findings.

Category 5
--------------
Scoring 5 indicates a high suspicion of cancer. In this instance, there’s at least a 95 percent chance of breast cancer. A biopsy is highly recommended to confirm results and determine the next steps for treatment.

Category 6
---------------
You can only score a 6 after you’ve had a biopsy and received diagnosis of breast cancer. This category and corresponding images used as a comparison show how the cancer is responding to necessary treatment, such as chemotherapy, surgery, or radiation.
