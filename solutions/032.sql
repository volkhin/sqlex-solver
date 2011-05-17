Select DISTINCT Q.country, CONVERT(NUMERIC(6,2), (sum((Q.bore * Q.bore * Q.bore) * Q.cnt) / sum(Q.cnt) / 2)) weight
From (Select c.country, c.class, c.bore, (
          Select (count(name)+
                 (Select count(T.ship) 
                  From (Select DISTINCT ship 
                        From Outcomes 
                        Where ship = c.class And ship Not In (Select name From Ships)) T )) cn       
          From Ships 
          Where class = c.class) cnt
     From classes c) Q
Where Q.cnt >  0
Group By Q.country
