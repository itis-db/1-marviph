WITH RECURSIVE ActivityHierarchy AS (
  SELECT a.ActivityId, a.ActivityTypeId, a.ParentId, '' AS Path, 0 AS Level
  FROM Activity a
  WHERE a.ActivityId = COALESCE(pn_activityid, 1)
  
  UNION ALL
  
  SELECT a.ActivityId, a.ActivityTypeId, a.ParentId, CONCAT(h.Path, ' -> ', a.ActivityTypeId) AS Path, h.Level + 1 AS Level
  FROM Activity a
  INNER JOIN ActivityHierarchy h ON a.ParentId = h.ActivityId
)
SELECT h.Path, 
  CASE 
    WHEN a.ActivityTypeId = 1 THEN p.ProgramAttribute
    WHEN a.ActivityTypeId = 2 THEN sp.SubProgramAttribute
    WHEN a.ActivityTypeId = 3 THEN pr.ProjectAttribute
    WHEN a.ActivityTypeId = 4 THEN c.ContractAttribute
    WHEN a.ActivityTypeId = 5 THEN pt.PointAttribute
  END AS EntityAttribute,
  ar.AreaAttribute,
  pt2.PointAttribute
FROM ActivityHierarchy h
LEFT JOIN Activity a ON a.ActivityId = h.ActivityId
LEFT JOIN Program p ON p.ProgramId = a.ActivityId
LEFT JOIN SubProgram sp ON sp.SubProgramId = a.ActivityId
LEFT JOIN Project pr ON pr.ProjectId = a.ActivityId
LEFT JOIN Contract c ON c.ContractId = a.ActivityId
LEFT JOIN Point pt ON pt.PointId = a.ActivityId
LEFT JOIN Area ar ON ar.AreaId = c.AreaId
LEFT JOIN Point pt2 ON pt2.PointId = c.ContractId
ORDER BY h.Level;
