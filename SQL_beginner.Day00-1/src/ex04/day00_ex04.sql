SELECT
    CONCAT(
        name,
        ' (age:',
        age,
        ',gender:''',
        gender,
        ''',address:''',
        address,
        ''')'
    ) AS person_information
FROM
    public.person
ORDER BY
    person_information ASC