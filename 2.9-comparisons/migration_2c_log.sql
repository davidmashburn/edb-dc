--execute 32ce8dec4f2a45b9a3dcf7a7d353946e556b72cc:
WITH "t~1" AS NOT MATERIALIZED (
    (
        SELECT
            "expr-12~2"."ObjectType_value~1" AS "expr~12_identity~1",
            "expr-12~2"."name_value~1" AS "name_value~2"
        FROM
            LATERAL (
                SELECT
                    "ObjectType~2".id AS "ObjectType_value~1",
                    "ObjectType~2"."40f1c439-7ce5-11ed-b4a8-3d9a2d302ff3" AS "name_value~1"
                FROM
                    edgedbstd."40ee7dfd-7ce5-11ed-9a59-f1a5c6f1a3e2_t" AS "ObjectType~2"
                    CROSS JOIN LATERAL (
                        SELECT
                            (
                                "expr-9~2"."expr~9_value~1"
                                OR "expr-10~2"."expr~10_value~1"
                            ) AS "expr~11_value~1"
                        FROM
                            LATERAL (
                                SELECT
                                    (
                                        NOT "ObjectType~2"."40f16742-7ce5-11ed-9d39-d15994ea9644"
                                    ) AS "expr~9_value~1"
                            ) AS "expr-9~2"
                            CROSS JOIN (
                                SELECT
                                    (NULL) :: uuid AS "v~2"
                            ) AS "v~1"
                            CROSS JOIN LATERAL (
                                SELECT
                                    (
                                        "ObjectType~2".id IS NOT DISTINCT
                                        FROM
                                            "v~1"."v~2"
                                    ) AS "expr~10_value~1"
                            ) AS "expr-10~2"
                    ) AS "expr-11~2"
                WHERE
                    "expr-11~2"."expr~11_value~1"
            ) AS "expr-12~2"
    )
),
"ins_contents~1" AS (
    (
        SELECT
            ('2e921e49-b12b-11ed-9852-2b1e99a34eaf') :: uuid AS __type__,
            "str_first_name~2"."expr~1_value~2" AS "2e94709c-b12b-11ed-bde0-c3b2c7ee4a24",
            "str_middle_name~2"."expr~3_value~2" AS "2e94888e-b12b-11ed-8f8f-e774eba5e93f",
            "uuid_id~2"."expr~7_value~1" AS id
        FROM
            LATERAL (
                SELECT
                    "expr-1~2"."expr~1_value~1" AS "expr~1_value~2"
                FROM
                    LATERAL (
                        SELECT
                            ($ 1) :: text AS "expr~1_value~1"
                    ) AS "expr-1~2"
            ) AS "str_first_name~2"
            CROSS JOIN LATERAL (
                SELECT
                    "expr-3~2"."expr~3_value~1" AS "expr~3_value~2"
                FROM
                    LATERAL (
                        SELECT
                            ($ 2) :: text AS "expr~3_value~1"
                    ) AS "expr-3~2"
            ) AS "str_middle_name~2"
            CROSS JOIN LATERAL (
                SELECT
                    "expr-7~2"."expr~6_value~1" AS "expr~7_value~1"
                FROM
                    LATERAL (
                        SELECT
                            "expr-6~2"."expr~5_value~3" AS "expr~6_value~1"
                        FROM
                            LATERAL (
                                SELECT
                                    "expr-5~2"."expr~5_value~2" AS "expr~5_value~3"
                                FROM
                                    LATERAL (
                                        SELECT
                                            "q~1"."expr~5_value~1" AS "expr~5_value~2"
                                        FROM
                                            LATERAL (
                                                SELECT
                                                    edgedbext.uuid_generate_v1mc() AS "expr~5_value~1"
                                            ) AS "q~1"
                                    ) AS "expr-5~2"
                            ) AS "expr-6~2"
                    ) AS "expr-7~2"
            ) AS "uuid_id~2"
    )
),
"ins~1" AS (
    INSERT INTO
        edgedbpub."2e921e49-b12b-11ed-9852-2b1e99a34eaf" AS "User~5" (
            __type__,
            "2e94709c-b12b-11ed-bde0-c3b2c7ee4a24",
            "2e94888e-b12b-11ed-8f8f-e774eba5e93f",
            id
        ) (
            (
                SELECT
                    __type__,
                    "2e94709c-b12b-11ed-bde0-c3b2c7ee4a24",
                    "2e94888e-b12b-11ed-8f8f-e774eba5e93f",
                    id
                FROM
                    "ins_contents~1" AS "ins_contents~2"
            )
        ) RETURNING "User~5".id AS "User_identity~1",
        "User~5".__type__ AS "__type___identity~1"
),
"m~1" AS (
    (
        SELECT
            "ins~2"."User_identity~1" AS "User_value~1",
            "ins~2"."__type___identity~1" AS "__type___identity~2"
        FROM
            "ins~1" AS "ins~2"
            INNER JOIN "ins_contents~1" AS "ins_contents~2" ON ("ins~2"."User_identity~1" = "ins_contents~2".id)
    )
),
__unused_vars AS (
    (
        SELECT
            ($ 3) :: text
    )
)
SELECT
    (
        (
            SELECT
                "str___tname__~4"."name_value~10" AS "__tname___serialized~2"
            FROM
                LATERAL (
                    SELECT
                        "str_name~4"."name_value~9" AS "name_value~10"
                    FROM
                        LATERAL (
                            SELECT
                                "q~10"."name_value~8" AS "name_value~9"
                            FROM
                                LATERAL (
                                    SELECT
                                        "q~9"."name_value~7" AS "name_value~8"
                                    FROM
                                        LATERAL (
                                            SELECT
                                                "User~9"."__type___identity~8" AS "__type___identity~9"
                                        ) AS "q~8"
                                        INNER JOIN LATERAL (
                                            SELECT
                                                "t~4"."expr~12_identity~1" AS "expr~12_identity~4",
                                                "t~4"."name_value~2" AS "name_value~7"
                                            FROM
                                                "t~1" AS "t~4"
                                        ) AS "q~9" ON (
                                            "q~8"."__type___identity~9" = "q~9"."expr~12_identity~4"
                                        )
                                ) AS "q~10"
                        ) AS "str_name~4"
                ) AS "str___tname__~4"
        ),
        (
            SELECT
                "uuid___tid__~4"."id_value~6" AS "__tid___serialized~2"
            FROM
                LATERAL (
                    SELECT
                        "uuid_id~8"."id_value~5" AS "id_value~6"
                    FROM
                        LATERAL (
                            SELECT
                                "q~13"."id_value~4" AS "id_value~5"
                            FROM
                                LATERAL (
                                    SELECT
                                        "q~12"."expr~12_identity~5" AS "id_value~4"
                                    FROM
                                        LATERAL (
                                            SELECT
                                                "User~9"."__type___identity~8" AS "__type___identity~10"
                                        ) AS "q~11"
                                        INNER JOIN LATERAL (
                                            SELECT
                                                "t~5"."expr~12_identity~1" AS "expr~12_identity~5"
                                            FROM
                                                "t~1" AS "t~5"
                                        ) AS "q~12" ON (
                                            "q~11"."__type___identity~10" = "q~12"."expr~12_identity~5"
                                        )
                                ) AS "q~13"
                        ) AS "uuid_id~8"
                ) AS "uuid___tid__~4"
        ),
        "User~9"."User_value~5"
    ) AS "User_serialized~1"
FROM
    LATERAL (
        SELECT
            "User~8"."User_value~4" AS "User_value~5",
            "User~8"."__type___identity~7" AS "__type___identity~8"
        FROM
            LATERAL (
                SELECT
                    "User~7"."User_value~3" AS "User_value~4",
                    "User~7"."__type___identity~6" AS "__type___identity~7"
                FROM
                    LATERAL (
                        SELECT
                            "User~6"."User_value~2" AS "User_value~3",
                            "User~6"."__type___identity~5" AS "__type___identity~6"
                        FROM
                            LATERAL (
                                SELECT
                                    "m~2"."User_value~1" AS "User_value~2",
                                    "m~2"."__type___identity~2" AS "__type___identity~5"
                                FROM
                                    "m~1" AS "m~2"
                            ) AS "User~6"
                    ) AS "User~7"
            ) AS "User~8"
    ) AS "User~9"
    
-- DETAIL:  parameters: $1 = 'Hiya', $2 = 'Wrld', $3 = 'insert0 was blocked by access policy'

--execute 219165c87625198a5858765dcad8fc4a222ab6b6:
SELECT
    "expr-10~3"."expr~10_serialized~1" AS "expr~10_serialized~2"
FROM
    LATERAL (
        SELECT
            COALESCE("q~1"."expr~10_value~1", (0) :: int8) AS "expr~10_serialized~1"
        FROM
            (
                SELECT
                    count("User~6"."User_value~2") AS "expr~10_value~1"
                FROM
                    LATERAL (
                        SELECT
                            "User~5"."User_value~1" AS "User_value~2"
                        FROM
                            LATERAL (
                                SELECT
                                    "User~4".id AS "User_value~1"
                                FROM
                                    edgedbpub."2e921e49-b12b-11ed-9852-2b1e99a34eaf_t" AS "User~4"
                            ) AS "User~5"
                    ) AS "User~6"
            ) AS "q~1"
    ) AS "expr-10~3"
    
--execute d5286a637cee1af5eec4f2154f5673c163c5ab15:
WITH "t~1" AS NOT MATERIALIZED (
    (
        SELECT
            "expr-4~2"."ObjectType_value~1" AS "expr~4_identity~1",
            "expr-4~2"."name_value~1" AS "name_value~2"
        FROM
            LATERAL (
                SELECT
                    "ObjectType~2".id AS "ObjectType_value~1",
                    "ObjectType~2"."40f1c439-7ce5-11ed-b4a8-3d9a2d302ff3" AS "name_value~1"
                FROM
                    edgedbstd."40ee7dfd-7ce5-11ed-9a59-f1a5c6f1a3e2_t" AS "ObjectType~2"
                    CROSS JOIN LATERAL (
                        SELECT
                            (
                                "expr-1~2"."expr~1_value~1"
                                OR "expr-2~2"."expr~2_value~1"
                            ) AS "expr~3_value~1"
                        FROM
                            LATERAL (
                                SELECT
                                    (
                                        NOT "ObjectType~2"."40f16742-7ce5-11ed-9d39-d15994ea9644"
                                    ) AS "expr~1_value~1"
                            ) AS "expr-1~2"
                            CROSS JOIN (
                                SELECT
                                    (NULL) :: uuid AS "v~2"
                            ) AS "v~1"
                            CROSS JOIN LATERAL (
                                SELECT
                                    (
                                        "ObjectType~2".id IS NOT DISTINCT
                                        FROM
                                            "v~1"."v~2"
                                    ) AS "expr~2_value~1"
                            ) AS "expr-2~2"
                    ) AS "expr-3~2"
                WHERE
                    "expr-3~2"."expr~3_value~1"
            ) AS "expr-4~2"
    )
)
SELECT
    (
        (
            SELECT
                "str___tname__~4"."name_value~10" AS "__tname___serialized~2"
            FROM
                LATERAL (
                    SELECT
                        "str_name~4"."name_value~9" AS "name_value~10"
                    FROM
                        LATERAL (
                            SELECT
                                "q~9"."name_value~8" AS "name_value~9"
                            FROM
                                LATERAL (
                                    SELECT
                                        "q~8"."name_value~7" AS "name_value~8"
                                    FROM
                                        LATERAL (
                                            SELECT
                                                "User~8"."__type___identity~5" AS "__type___identity~6"
                                        ) AS "q~7"
                                        INNER JOIN LATERAL (
                                            SELECT
                                                "t~4"."expr~4_identity~1" AS "expr~4_identity~4",
                                                "t~4"."name_value~2" AS "name_value~7"
                                            FROM
                                                "t~1" AS "t~4"
                                        ) AS "q~8" ON (
                                            "q~7"."__type___identity~6" = "q~8"."expr~4_identity~4"
                                        )
                                ) AS "q~9"
                        ) AS "str_name~4"
                ) AS "str___tname__~4"
        ),
        (
            SELECT
                "uuid___tid__~4"."id_value~7" AS "__tid___serialized~2"
            FROM
                LATERAL (
                    SELECT
                        "uuid_id~7"."id_value~6" AS "id_value~7"
                    FROM
                        LATERAL (
                            SELECT
                                "q~12"."id_value~5" AS "id_value~6"
                            FROM
                                LATERAL (
                                    SELECT
                                        "q~11"."expr~4_identity~5" AS "id_value~5"
                                    FROM
                                        LATERAL (
                                            SELECT
                                                "User~8"."__type___identity~5" AS "__type___identity~7"
                                        ) AS "q~10"
                                        INNER JOIN LATERAL (
                                            SELECT
                                                "t~5"."expr~4_identity~1" AS "expr~4_identity~5"
                                            FROM
                                                "t~1" AS "t~5"
                                        ) AS "q~11" ON (
                                            "q~10"."__type___identity~7" = "q~11"."expr~4_identity~5"
                                        )
                                ) AS "q~12"
                        ) AS "uuid_id~7"
                ) AS "uuid___tid__~4"
        ),
        "User~8"."User_value~3",
        (
            SELECT
                "str_first_name_0~2"."expr~13_value~2" AS "first_name_0_serialized~1"
            FROM
                LATERAL (
                    SELECT
                        "expr-13~2"."expr~13_value~1" AS "expr~13_value~2"
                    FROM
                        LATERAL (
                            SELECT
                                edgedb._slice(
                                    "User~8"."first_name_value~3",
                                    ("expr-11~2"."expr~11_value~1") :: integer,
                                    ("expr-12~2"."expr~12_value~1") :: integer
                                ) AS "expr~13_value~1"
                            FROM
                                LATERAL (
                                    SELECT
                                        ($ 3) :: int8 AS "expr~11_value~1"
                                ) AS "expr-11~2"
                                CROSS JOIN LATERAL (
                                    SELECT
                                        ($ 4) :: int8 AS "expr~12_value~1"
                                ) AS "expr-12~2"
                        ) AS "expr-13~2"
                ) AS "str_first_name_0~2"
        ),
        (
            SELECT
                "str_middle_name_1~2"."expr~17_value~2" AS "middle_name_1_serialized~1"
            FROM
                LATERAL (
                    SELECT
                        "expr-17~2"."expr~17_value~1" AS "expr~17_value~2"
                    FROM
                        LATERAL (
                            SELECT
                                edgedb._slice(
                                    "User~8"."middle_name_value~3",
                                    ("expr-15~2"."expr~15_value~1") :: integer,
                                    ("expr-16~2"."expr~16_value~1") :: integer
                                ) AS "expr~17_value~1"
                            FROM
                                LATERAL (
                                    SELECT
                                        ($ 5) :: int8 AS "expr~15_value~1"
                                ) AS "expr-15~2"
                                CROSS JOIN LATERAL (
                                    SELECT
                                        ($ 6) :: int8 AS "expr~16_value~1"
                                ) AS "expr-16~2"
                        ) AS "expr-17~2"
                ) AS "str_middle_name_1~2"
        )
    ) AS "User_serialized~1"
FROM
    LATERAL (
        SELECT
            "User~7"."User_value~2" AS "User_value~3",
            "User~7"."__type___identity~4" AS "__type___identity~5",
            "User~7"."first_name_value~2" AS "first_name_value~3",
            "User~7"."middle_name_value~2" AS "middle_name_value~3"
        FROM
            LATERAL (
                SELECT
                    "User~6"."User_value~1" AS "User_value~2",
                    "User~6"."__type___identity~3" AS "__type___identity~4",
                    "User~6"."first_name_value~1" AS "first_name_value~2",
                    "User~6"."middle_name_value~1" AS "middle_name_value~2"
                FROM
                    LATERAL (
                        SELECT
                            "User~5".id AS "User_value~1",
                            "User~5".__type__ AS "__type___identity~3",
                            "User~5"."2e94709c-b12b-11ed-bde0-c3b2c7ee4a24" AS "first_name_value~1",
                            "User~5"."2e94888e-b12b-11ed-8f8f-e774eba5e93f" AS "middle_name_value~1"
                        FROM
                            edgedbpub."2e921e49-b12b-11ed-9852-2b1e99a34eaf_t" AS "User~5"
                    ) AS "User~6"
                ORDER BY
                    "User~6"."User_value~1" ASC NULLS FIRST
            ) AS "User~7" OFFSET (
                SELECT
                    "expr-9~2"."expr~9_value~1" AS "expr~9_value~2"
                FROM
                    LATERAL (
                        SELECT
                            ($ 1) :: int4 AS "expr~9_value~1"
                    ) AS "expr-9~2"
            )
        LIMIT
            (
                SELECT
                    "expr-10~2"."expr~10_value~1" AS "expr~10_value~2"
                FROM
                    LATERAL (
                        SELECT
                            ($ 2) :: int8 AS "expr~10_value~1"
                    ) AS "expr-10~2"
            )
    ) AS "User~8"

-- DETAIL:  parameters: $1 = '0', $2 = '100', $3 = '0', $4 = '100', $5 = '0', $6 = '100'