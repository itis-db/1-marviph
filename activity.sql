SELECT p.ProgramAttribute, sp.SubProgramAttribute, ar.AreaAttribute, pr.ProjectAttribute, pt.PointAttribute, c.ContractAttribute, pt2.PointAttribute
FROM Activity a
LEFT JOIN Program p ON p.ProgramId = a.ActivityId
LEFT JOIN SubProgram sp ON sp.SubProgramId = a.ActivityId
LEFT JOIN Project pr ON pr.ProjectId = a.ActivityId
LEFT JOIN Contract c ON c.ContractId = a.ActivityId
LEFT JOIN Area ar ON ar.AreaId = c.AreaId
LEFT JOIN Point pt ON pt.PointId = pr.ProjectId
LEFT JOIN Point pt2 ON pt2.PointId = c.ContractId
WHERE a.ActivityTypeId IN (1, 2, 3, 4, 5)
ORDER BY a.ActivityId;
