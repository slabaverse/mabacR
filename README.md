
# mabacR

`mabacR` is an R package that runs the MABAC, a multi-criteria decision-making method. This package provides a powerful tool that helps decision-making, creating a ranking with the optimal choice of analyzed items.

## Installation

You can install the package directly from GitHub using the `devtools`. Run the following command in R:

```R
# Install devtools if you haven't already
install.packages("devtools")

# Install mabacR from GitHub
devtools::install_github("https://github.com/slabaverse/mabacR.git")
```
Or through CRAN, the official R repository. Run this command in R:

```R
install.packages("mabacR")
```

## Usage

### Main Function

```R
mabacR()
```

### Description

The `mabacR` function accepts a dataset that must contain, necessarily in this order:

1. A column with the criteria: This column contains the criteria that will define the best choices. Replace the labels ​​[ C1, C2, C3, ..., Cn ] with the defined criteria names;
   
2. A column with the weights: The weights determine the importance of the criteria. If closer to 1, more impactful, if closer to 0, less impactful. The sum of the weights must be equal to 1;

3. A column with the types: The types of criteria are **1**, benefit, what we want to maximize; or **-1**, cost, what we want to minimize.
   
4. And the columns with the evaluated items: Remember to replace the labels [A1, A2, A3, ..., An] with the names of the analyzed items.

e.g.1 :

| criteria | weight   | type   | A1       | A2       | A3       | A4       | A5       | A6       | A7        |   
|----------|----------|--------|----------|----------|----------|----------|----------|----------|-----------|
| C1       | 0.146    | -1     | 22600.00 | 19500.00 | 21700.00 | 20600.00 | 22500.00 | 23250.00 | 20300.00  |
| C2       | 0.144    |  1     | 3800.00  | 4200.00  | 4000.00  | 3800.00  | 3800.00  | 4210.00  | 3850.00   |
| C3       | 0.119    |  1     | 2.00     | 3.00     | 1.00     | 2.00     | 4.00     | 3.00     | 2.00      |
| C4       | 0.121    |  1     | 5.00     | 2.00     | 3.00     | 5.00     | 3.00     | 5.00     | 5.00      |
| C5       | 0.115    | -1     | 1.06     | 0.95     | 1.25     | 1.05     | 1.35     | 1.45     | 0.90      |
| C6       | 0.101    | -1     | 3.00     | 3.00     | 3.20     | 3.25     | 3.20     | 3.60     | 3.25      |
| C7       | 0.088    |  1     | 3.50     | 3.40     | 3.30     | 3.20     | 3.70     | 3.50     | 3.00      |
| C8       | 0.068    |  1     | 2.80     | 2.20     | 2.50     | 2.00     | 2.10     | 2.80     | 2.60      |
| C9       | 0.050    |  1     | 24.50    | 24.00    | 24.50    | 22.50    | 23.00    | 23.50    | 21.50     |
| C10      | 0.048    |  1     | 6.50     | 7.00     | 7.30     | 11.00    | 6.30     | 7.00     | 6.00      |

*Data extracted from the paper that presented the method.

### Parameters

The only parameter requested by the function is a dataset as shown in **e.g.1**.
You can check that dataset by running the command:

```R
data(mabac_df)
```

### Return

The function returns a ranking with the optimal choice according to your criteria, weights, and types of criteria.

e.g.2:

|Items | Ranking     |
|------|-------------|
| A2   | 0.21833375  |
| A1   | 0.08259070  |
| A6   | 0.04653858  |
| A7   | 0.04641242  |
| A4   | 0.02461733  |
| A3   | -0.04881552 |
| A5   | -0.07042947 |

### Example

```R
# Example usage of the mabacR function

library(mabacR) # Load package
data(mabac_df) # Load your dataset
output <- mabacR(mabac_df) # Run the function
print(output) # Print the resulting ranking
```

I invite you to check out the paper that introduced MABAC, we based ourselves on the math presented there to create this tool, in addition, the data used in the standard spreadsheet comes from this work:
**"PAMUČAR, D.; ĆIROVIĆ, G. The selection of transport and handling resources in logistics centers using Multi-Attributive Border Approximation area Comparison (MABAC). Expert systems with applications, v. 42, n. 6, p. 3016–3028, 2015."**

## Contribution

Contributions are welcome! Feel free to open issues or pull requests.

## License

This package is licensed under the MIT License.

## Contact

If you have any questions, feel free to reach out:

- **Author:** Adam Slabadack
- **Email:** arslabadack@gmail.com
```
