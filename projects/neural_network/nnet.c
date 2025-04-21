#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>

typedef struct Matrix {
    size_t rows;
    size_t cols;
    float* start;
} matrix_t ;


matrix_t matalloc(float mat[], size_t row, size_t col) {
    matrix_t m = {
        .rows = row,
        .cols = col,
    };

    m.start = (float*)(malloc(sizeof(float)*row*col));
    for (size_t i = 0; i < row*col; ++i) {
        m.start[i] = mat[i];
    }

    return m;
}

void print_matrix(matrix_t m) {
    for (size_t i = 0; i < m.rows; ++i) {
        for (size_t j = 0; j < m.cols; ++j) {
            printf("%f, ", m.start[i*m.cols+j]);
        }

        printf("\n");
    }
}

matrix_t create_matrix(float* arry, size_t rows, size_t cols) {
    matrix_t matrix = {
        .rows = rows,
        .cols = cols,
        .start = arry,
    };

    return matrix;
}

/* NOTE: We will not be checking if rows(source_a), cols(source_a) is equal ot rows(source_b), cols(source_b) or not!! 
 * AND: if dest..'s rows/cols is equal to sources_[a/b]'s !!!*/

void add_matrices(matrix_t dest, matrix_t source_a, matrix_t source_b) {
    for (size_t i = 0; i < source_a.rows; ++i) {
        for (size_t j = 0; j < source_a.cols; ++j) {
            dest.start[i*source_a.cols+j] = source_a.start[i*source_a.cols+j] + source_b.start[i*source_a.cols+j];
        }
    }
}

/* NOTE: We will not be checking if rows(source_a), cols(source_a) is equal ot rows(source_b), cols(source_b) or not!! 
 * AND: if dest..'s rows/cols is equal to sources_[a/b]'s !!!*/

void multiply_matrices(matrix_t dest, matrix_t sa, matrix_t sb) {
}

// Y = E(XW + B)
int main(void) {
    float init_value[] = {
        2.0f, 2.0f, 3.0f, 2.7f,
    };

    float dinit_value[] = {
        3.0f, 3.0f, 2.0f, 2.3f,
    };

    matrix_t mat = matalloc(init_value, 1, 4);
    add_matrices(mat, create_matrix(init_value, 1, 4), create_matrix(dinit_value, 1, 4));
    print_matrix(mat);

    free(mat.start);
    return 0;
}
