
# mabacR

`mabacR` is an R package that executes the mathematical algorithms that make up the MABAC method, a multi-criteria decision-making method. The package normalizes the data, applies weights, determines the border area, calculates distances to this area, and finally generates a ranking with the optimal option.

## Installation

You can install the package directly from GitHub using the `devtools` package. Run the following command in R:

```R
# Install devtools if you haven't already
install.packages("devtools")

# Install mabacR from GitHub
devtools::install_github("https://github.com/slabaverse/mabacR.git")
```

## Usage

### Main Function

```R
mabacR(mabac_df)
```

### Description

The `mabacR` function accepts a dataset that must contain, necessarily in this order:

1. A column with the criteria.
2. A column with the weights (which must sum to 1).
3. A column with the types (1 for maximization and -1 for minimization).
4. And the columns with the evaluated items.

### Parameters

- **mabac_df:** The original dataset.

### Return

The function returns a ranking with the optimal choice according to your criteria, weights, and types of criteria.

### Example

```R
# Example usage of the mabacR function
data(mabac_df) # Load your dataset
output <- mabacR(mabac_df) # Run the function
print(output) # Print the resulting ranking
```

## Contribution

Contributions are welcome! Feel free to open issues or pull requests.

## License

This package is licensed under the MIT License.

## Contact

If you have any questions, feel free to reach out:

- **Author:** Adam Slabadack
- **Email:** arslabadack@gmail.com
```
