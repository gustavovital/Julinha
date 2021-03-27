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
using JLD
using NPZ
using RData

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
@show G[1][1][1:10]

# @show G[1][1]
# @show (G[1][1][1])

D = DataFrame(G...) # Same as DataFrame(G[1], G[2])
# D.RegionName

# groupby(D, :StateName, :SizeRank) # funções nao comportam mais o jl

foods = ["apple", "cucumber", "tomato", "banana"]
calories = [105, 47, 22, 105]
prices = [0.85, 1.6, 0.8, 0.6]

dataframe_calories = DataFrame(item=foods, calories=calories)
dataframe_prices = DataFrame(item=foods, prices=prices)

DF = leftjoin(dataframe_calories, dataframe_prices, on=:item)

# More stuff
R_data = RData.load("Julia for Data Science/Data/mywrite.rda")
# Find how to convert dict to df!!! For the other db, do the same stuff

function year_created(P, language::String)
    loc = findfirst(P[:, 2] .== language)
    return P[loc, 1]
end

function year_created_for(data, language::String)
    for lang in 1:length(data)
        if data[lang, 2] == language
            return data[lang, 1]
        end
    end
    
end

@btime year_created(P, "Julia")
@btime year_created_for(P, "Julia")
