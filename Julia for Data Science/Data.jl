#=
No author? No date? Jst boring ;(
More stuff
=#

# Lot of modules i should use, time of class: 40 f*****g 7 minutes

using BenchmarkTools
using DataFrames
using DelimitedFiles
using CSV
using XLSX

#  About Download
P = download("https://raw.githubusercontent.com/nassarhuda/easy_data/master/programming_languages.csv",
    "programminglanguages.csv")

#=
readdlm(source,
    delim::AbstractChar,
    T::Type,
    eol::AbstractChar;
    header=false,
    skipstart=0,
    skipblanks=true,
    use_mmap,
    quotes=true,
    dims,
    comments=false,
    comment_char='#')
=#

# For now, lets read as a csv
P, H = readdlm("programminglanguages.csv", ','; header=true)
C = CSV.read("programminglanguages.csv", DataFrame)

@show typeof(C)
@show C[1:10,:]
@show C[!,:language]
@show C.year

@show names(C)
@show describe(C)

@btime P, H = readdlm("programminglanguages.csv", ','; header=true)
@btime C = CSV.read("programminglanguages.csv", DataFrame)

#  Reading from xlsx file:
@btime T = XLSX.readdata("Julia for Data Science/Data/zillow_data_download_april2020.xlsx", #file name
    "Sale_counts_city", #sheet name
    "A1:F9" #cell range
    )

# @btime G = XLSX.readtable("Julia for Data Science/Data/zillow_data_download_april2020.xlsx",
#     "Sale_counts_city")
G = XLSX.readtable("Julia for Data Science/Data/zillow_data_download_april2020.xlsx",
    "Sale_counts_city")
