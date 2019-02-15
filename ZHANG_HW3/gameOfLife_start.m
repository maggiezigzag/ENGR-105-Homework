% gameOfLife_start.m
% Set up the initial matrix and call the gameOfLife.

clear; clc; close all % clean up workspace and close all figures

% Defines the initial, starting matrix for the Game of Life.
% ***Feel free to change this matrix.***
matrixIn = [1 0 0 0 0 1 0 0 0 0 0 0; ...
    0 1 0 0 0 1 1 1 1 0 0 0; ...
    0 0 0 0 0 0 0 0 0 0 0 0; ...
    0 1 0 0 0 0 0 0 0 1 0 0; ...
    0 0 0 0 0 0 1 1 0 0 0 0; ...
    1 1 1 0 0 0 0 0 0 0 0 0];

% Number of iterations of the Game of life. ***Feel free to
% adjust the number of iterations.***
iters = 100;

% Call the game of life with initial matrix MatrixIn, evolve the
% game for iters iterations, and return the final state of the
% game, outState.
outState = gameOfLife(matrixIn,iters);