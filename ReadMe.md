---
title: "ShinyProject"
author: "Rakesh Muralidharan"
date: "Sunday, May 24, 2015"
output: html_document
---

This is simple Shiny Application created as a Project for "Developing Data Products course on Coursera". 

The Shiny App does the following...
1) Uses the USArrests datafile which has data for violent crimes for 50 US states.
2) Creates a UI to take inputs from user for selecting crime type and Urban population value for prediction.
3) Reactively plots the selected crime type (per 100,000) vs. Urban population (%).
4) Uses simple linear regression to predict and reactively displays the predicted crime rate for selected crime type in drop box and urban population value in slidebar.
