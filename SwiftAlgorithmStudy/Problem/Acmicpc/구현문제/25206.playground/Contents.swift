/*
 25206
 너의 평점
 */


//var ss = [
//    "ObjectOrientedProgramming1 3.0 A+",
//    "IntroductiontoComputerEngineering 3.0 A+",
//    "ObjectOrientedProgramming2 3.0 A0",
//    "CreativeComputerEngineeringDesign 3.0 A+",
//    "AssemblyLanguage 3.0 A+",
//    "InternetProgramming 3.0 B0",
//    "ApplicationProgramminginJava 3.0 A0",
//    "SystemProgramming 3.0 B0",
//    "OperatingSystem 3.0 B0",
//    "WirelessCommunicationsandNetworking 3.0 C+",
//    "LogicCircuits 3.0 B0",
//    "DataStructure 4.0 A+",
//    "MicroprocessorApplication 3.0 B+",
//    "EmbeddedSoftware 3.0 C0",
//    "ComputerSecurity 3.0 D+",
//    "Database 3.0 C+",
//    "Algorithm 3.0 B0",
//    "CapstoneDesigninCSE 3.0 B+",
//    "CompilerDesign 3.0 D0",
//    "ProblemSolving 4.0 P"
//]
//
//var ss1 = [
//    "BruteForce 3.0 F",
//    "Greedy 1.0 F",
//    "DivideandConquer 2.0 F",
//    "DynamicProgramming 3.0 F",
//    "DepthFirstSearch 4.0 F",
//    "BreadthFirstSearch 3.0 F",
//    "ShortestPath 4.0 F",
//    "DisjointSet 2.0 F",
//    "MinimumSpanningTree 2.0 F",
//    "TopologicalSorting 1.0 F",
//    "LeastCommonAncestor 2.0 F",
//    "SegmentTree 4.0 F",
//    "EulerTourTechnique 3.0 F",
//    "StronglyConnectedComponent 2.0 F",
//    "BipartiteMatching 2.0 F",
//    "MaximumFlowProblem 3.0 F",
//    "SuffixArray 1.0 F",
//    "HeavyLightDecomposition 4.0 F",
//    "CentroidDecomposition 3.0 F",
//    "SplayTree 1.0 F"
//]


import Foundation
var grades = ["A+": 4.5,"A0": 4.0,"B+": 3.5,"B0": 3.0,"C+": 2.5,"C0": 2.0,"D+": 1.5,"D0": 1.0,"F": 0.0,]
var totalScore=0.0,totalCredit=0.0
while let s=readLine(){
    let subject=s.split(separator:" ")
    if let grade=grades[String(subject[2])],
        let credit=Double(subject[1]) {
        totalScore+=credit*grade
        totalCredit+=credit
    }
}
let digit = pow(10.0, 6.0)
print(round((totalScore/totalCredit)*digit)/digit)
