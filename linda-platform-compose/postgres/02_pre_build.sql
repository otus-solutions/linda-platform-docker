-- Function: extraction.yesno_mapping(character varying)

-- DROP FUNCTION extraction.yesno_mapping(character varying);
CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS integer AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NO' THEN 0  WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;


-- Function: extraction.metadata_mapping(character varying)

-- DROP FUNCTION extraction.metadata_mapping(character varying);
CREATE OR REPLACE FUNCTION extraction.metadata_mapping(value character varying) RETURNS character varying AS $$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'MISSING_DATA' THEN '.F' WHEN 'DOES_NOT_KNOW' THEN '.S' WHEN 'DOES_NOT_WANT_TO_ANSWER' THEN '.Q' WHEN 'DOES_NOT_APPLY' THEN '.A' WHEN 'SKIPPED' THEN '.P' WHEN 'ACCEPT_ANSWER' THEN '.X' WHEN 'NO_DATA' THEN '.D' WHEN 'ACCEPT_TUBE_TYPE' THEN '.T' WHEN 'OTHER' THEN '.O' ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.metadata_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.metadata_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM ELCA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NO' THEN 0  WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;


--###################################################################--
--########################## / FORM GSTA ##########################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.race_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'BLACK' THEN 1 WHEN 'BROWN' THEN 2 WHEN 'WHITE' THEN 3 WHEN 'YELLOW' THEN 4 WHEN 'INDIGENOUS' THEN 5ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.race_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.race_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.schooling_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'ILLITERATE' THEN 1 WHEN 'INCOMPLETE_BASIC' THEN 2 WHEN 'COMPLETE_BASIC' THEN 3 WHEN 'INCOMPLETE_HIGH_SCHOOL' THEN 4 WHEN 'COMPLETE_HIGH_SCHOOL' THEN 5 WHEN 'INCOMPLETE_GRADUATION' THEN 6 WHEN 'COMPLETE_GRADUATION' THEN 7ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.schooling_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.schooling_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.familyincome_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'HALF_MINIMUN_WAGE' THEN 1 WHEN 'BETWEEN_MINIMUN_AND_ONE_WAGE' THEN 2 WHEN 'BETWEEN_ONE_AND_TWO_WAGES' THEN 3 WHEN 'BETWEEN_TWO_AND_THREE_WAGES' THEN 4 WHEN 'BETWEEN_THREE_AND_FOUR_WAGES' THEN 5 WHEN 'BETWEEN_FOUR_AND_FIVE_WAGES' THEN 6 WHEN 'BETWEEN_FIVE_AND_SIX_WAGES' THEN 7 WHEN 'BETWEEN_SIX_AND_SEVEN_WAGES' THEN 8 WHEN 'BETWEEN_SEVEN_AND_EIGHT_WAGES' THEN 9 WHEN 'AT_LEAST_EIGHT_WAGES' THEN 10ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.familyincome_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.familyincome_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.birthweight_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'BELOW_2_5' THEN 1 WHEN 'BETWEEN_2_5_AND_4' THEN 2 WHEN 'ABOVE_4' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.birthweight_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.birthweight_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmanymonths_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NONE' THEN 0  WHEN 'LESS_THAN_ONE' THEN 1 WHEN 'BETWEEN_ONE_AND_THREE' THEN 2 WHEN 'BETWEEN_FOUR_AND_FIVE' THEN 3 WHEN 'AT_LEAST_SIX' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmanymonths_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmanymonths_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.laughability_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'AS_USUAL' THEN 1 WHEN 'NOT_LIKE_BEFORE' THEN 2 WHEN 'LESS_THAN_BEFORE' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.laughability_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.laughability_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.cheerfuloutlook_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'AS_USUAL' THEN 1 WHEN 'NOT_LIKE_BEFORE' THEN 2 WHEN 'MUCH_LESS_THAN_BEFORE' THEN 3 WHEN 'HARDLY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.cheerfuloutlook_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.cheerfuloutlook_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.selfpunishment_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NO' THEN 1 WHEN 'RARELY' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'OFTEN' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.selfpunishment_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.selfpunishment_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.concern_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.concern_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.concern_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.panicfeeling_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.panicfeeling_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.panicfeeling_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.overloaded_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.overloaded_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.overloaded_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.sleepproblems_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.sleepproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.sleepproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.unhappyfeeling_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'MANY_TIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NO_WAY' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.unhappyfeeling_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.unhappyfeeling_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.beencrying_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'OFTEN' THEN 1 WHEN 'MANY_TIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'NEVER' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.beencrying_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.beencrying_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.actagainstmyself_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'MANY_TIMES' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'RARELY' THEN 3 WHEN 'NEVER' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.actagainstmyself_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.actagainstmyself_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.consumptionfrequency_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'AT_LAUNCH' THEN 1 WHEN 'AT_DINNER' THEN 2 WHEN 'AT_LAUNCH_AND_DINNER' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.consumptionfrequency_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.consumptionfrequency_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.chickenpreparing_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'WITH_FUR' THEN 1 WHEN 'WITHOUT_FUR' THEN 0ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.chickenpreparing_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.chickenpreparing_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.intensitydegree_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'INCREASED' THEN 1 WHEN 'DECREASED' THEN 2 WHEN 'SAME' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.intensitydegree_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.intensitydegree_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.shouldornot_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'SHOULD' THEN 1 WHEN 'SHOULD_CHANGE' THEN 2 WHEN 'SHOULD_NOT' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.shouldornot_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.shouldornot_mapping(character varying) TO estatistica;

--###################################################################--
--########################## / FORM GSTB ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.race_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'BLACK' THEN 1 WHEN 'BROWN' THEN 2 WHEN 'WHITE' THEN 3 WHEN 'YELLOW' THEN 4 WHEN 'INDIGENOUS' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.race_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.race_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.schooling_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ILLITERATE' THEN 1 WHEN 'INCOMPLETE_BASIC' THEN 2 WHEN 'COMPLETE_BASIC' THEN 3 WHEN 'INCOMPLETE_HIGH_SCHOOL' THEN 4 WHEN 'COMPLETE_HIGH_SCHOOL' THEN 5 WHEN 'INCOMPLETE_GRADUATION' THEN 6 WHEN 'COMPLETE_GRADUATION' THEN 7 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.schooling_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.schooling_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.familyincome_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'HALF_MINIMUN_WAGE' THEN 1 WHEN 'BETWEEN_MINIMUN_AND_ONE_WAGE' THEN 2 WHEN 'BETWEEN_ONE_AND_TWO_WAGES' THEN 3 WHEN 'BETWEEN_TWO_AND_THREE_WAGES' THEN 4 WHEN 'BETWEEN_THREE_AND_FOUR_WAGES' THEN 5 WHEN 'BETWEEN_FOUR_AND_FIVE_WAGES' THEN 6 WHEN 'BETWEEN_FIVE_AND_SIX_WAGES' THEN 7 WHEN 'BETWEEN_SIX_AND_SEVEN_WAGES' THEN 8 WHEN 'BETWEEN_SEVEN_AND_EIGHT_WAGES' THEN 9 WHEN 'AT_LEAST_EIGHT_WAGES' THEN 10 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.familyincome_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.familyincome_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.birthweight_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'BELOW_2_5' THEN 1 WHEN 'BETWEEN_2_5_AND_4' THEN 2 WHEN 'ABOVE_4' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.birthweight_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.birthweight_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmanymonths_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NONE' THEN 0 WHEN 'LESS_THAN_ONE' THEN 1 WHEN 'BETWEEN_ONE_AND_THREE' THEN 2 WHEN 'BETWEEN_FOUR_AND_FIVE' THEN 3 WHEN 'AT_LEAST_SIX' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmanymonths_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmanymonths_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.consumptionfrequency_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'AT_LAUNCH' THEN 1 WHEN 'AT_DINNER' THEN 2 WHEN 'AT_LAUNCH_AND_DINNER' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.consumptionfrequency_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.consumptionfrequency_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.chickenpreparing_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WITH_FUR' THEN 1 WHEN 'WITHOUT_FUR' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.chickenpreparing_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.chickenpreparing_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.intensitydegree_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'INCREASED' THEN 1 WHEN 'DECREASED' THEN 2 WHEN 'SAME' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.intensitydegree_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.intensitydegree_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.shouldornot_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SHOULD' THEN 1 WHEN 'SHOULD_CHANGE' THEN 2 WHEN 'SHOULD_NOT' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.shouldornot_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.shouldornot_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM INTA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.situtation_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'HAD_NO_CHILDREN' THEN 1 WHEN 'HAS_CHILDREN_NEVER_BREASTFEEDING' THEN 2 WHEN 'HAS_CHILDREN_BREASTFEEDING_ABOVE_SIX_MONTHS' THEN 3 WHEN 'HAS_CHILDREN_BREASTFEEDING_UP_TO_SIX_MONTHS' THEN 4ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.situtation_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.situtation_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.breastfeedingplan_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'IS_PLANNING_BREASTFEEDING' THEN 1 WHEN 'IS_NOT_PLANNING_BREASTFEEDING' THEN 2ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.breastfeedingplan_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.breastfeedingplan_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.breastfeedingplanoption_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'GIVE_REASONS' THEN 1 WHEN 'DID_NOT_GIVE_REASONS' THEN 0ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.breastfeedingplanoption_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.breastfeedingplanoption_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.uniquetwins_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'UNIQUE' THEN 0  WHEN 'TWINS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.uniquetwins_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.uniquetwins_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesnoupper_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NO' THEN 0  WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnoupper_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnoupper_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM PRTA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.uniquetwins_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'UNIQUE' THEN 0  WHEN 'TWINS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.uniquetwins_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.uniquetwins_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM LAPA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.stillpregnant_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NOT_IS_BORN' THEN 1 WHEN 'NOT_PASSED_AWAY' THEN 2 WHEN 'YES_STILL_PREGNANT' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stillpregnant_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stillpregnant_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'YES' THEN 1 WHEN 'NO' THEN 0ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesbreastfeeding_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NO' THEN 0  WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesbreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesbreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.babysiting_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'FINE' THEN 0  WHEN 'WITH_PROBLEMS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.babysiting_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.babysiting_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.sex_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'MALE' THEN 1 WHEN 'FEMALE' THEN 0ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.sex_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.sex_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'SINGLE' THEN 0  WHEN 'TWIN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typebirth_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'NORMAL' THEN 0  WHEN 'CESAREAN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typebirth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typebirth_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typeofbabyfood_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value  WHEN 'ONLY_BREAST' THEN 1 WHEN 'BREAST_TEA_OR_WATER' THEN 2 WHEN 'BREAST_MILK_AND_FORMULA' THEN 3ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typeofbabyfood_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typeofbabyfood_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM LIUA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.siteofcare_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SUS' THEN 1 WHEN 'HEALTH_PLAN' THEN 0 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.siteofcare_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.siteofcare_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typeofbabyfoodrestrictedquestion_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONLY_BREAST' THEN 1 WHEN 'OTHERS' THEN 2 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typeofbabyfoodrestrictedquestion_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typeofbabyfoodrestrictedquestion_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.diabetestestrequisition_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO_USED_INSULIN' THEN 1 WHEN 'NO_NOUSED_INSULIN' THEN 2 WHEN 'YES' THEN 3 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.diabetestestrequisition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.diabetestestrequisition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.diabetestestresult_mapping(value character varying) RETURNS int AS $$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO_USED_INSULIN' THEN 2 WHEN 'NO_NOUSED_INSULIN' THEN 3 ELSE NULL END INTO result; RETURN result; END; $$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.diabetestestresult_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.diabetestestresult_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM LIDA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.beingbreastfed_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONLY_BREASTFEED' THEN 1 WHEN 'OTHER_LIQUIDS' THEN 2 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.beingbreastfed_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.beingbreastfed_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.twins_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'UNIQUE' THEN 0 WHEN 'TWINS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.twins_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.twins_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM RCPA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercasedontcolecturine_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM PCOA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.bodyshape_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONE' THEN 1 WHEN 'TWO' THEN 2 WHEN 'THREE' THEN 3 WHEN 'FOUR' THEN 4 WHEN 'FIVE' THEN 5 WHEN 'SIX' THEN 6 WHEN 'SEVEN' THEN 7 WHEN 'EIGHT' THEN 8 WHEN 'NINE' THEN 9 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.bodyshape_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.bodyshape_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM SAUA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.healthstatus_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERY_GOOD' THEN 1 WHEN 'GOOD' THEN 2 WHEN 'AVERAGE' THEN 3 WHEN 'BAD' THEN 4 WHEN 'VERY_BAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.healthstatus_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.healthstatus_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM RPNA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'SINGLE' THEN 0 WHEN 'TWIN' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM SONA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsleepproblems_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LESSTHANONCE' THEN 2 WHEN 'ONEORTWO' THEN 3 WHEN 'THREEORFOUR' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.difficultyintasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LITTLE' THEN 2 WHEN 'REASONABLE' THEN 3 WHEN 'GREATDIFFICULTY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.difficultyintasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.difficultyintasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.qualitysleep_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERYGOOD' THEN 1 WHEN 'GOOD' THEN 2 WHEN 'BAD' THEN 3 WHEN 'VERYBAD' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.qualitysleep_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.qualitysleep_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM COAA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.frequencyofbingeeatingchoice_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'LESS_THAN_ONCE_PER_WEEK' THEN 2 WHEN 'ONCE_A_WEEK' THEN 3 WHEN 'TWO_OR_MORE_TIMES_A_WEEK' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofbingeeatingchoice_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofbingeeatingchoice_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM EDGA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.moodstate_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_ALWAYS' THEN 1 WHEN 'NOT_ALWAYS' THEN 2 WHEN 'TODAY_LESS' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.moodstate_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.moodstate_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.futurehappiness_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_ALWAYS' THEN 1 WHEN 'NOT_ALWAYS' THEN 2 WHEN 'TODAY_LESS' THEN 3 WHEN 'NOT' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.futurehappiness_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.futurehappiness_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.guiltwithoutreason_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO_WAY' THEN 1 WHEN 'RARELY' THEN 2 WHEN 'SOMETIMES_HAPPENS' THEN 3 WHEN 'YES_OFTENTIMES' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.guiltwithoutreason_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.guiltwithoutreason_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.withanxiety_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_HAPPENS' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.withanxiety_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.withanxiety_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frightenedorpanic_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frightenedorpanic_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frightenedorpanic_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.overloadedwithtasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NOT_HAPPENS' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.overloadedwithtasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.overloadedwithtasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.unhappinessdifficultysleeping_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.unhappinessdifficultysleeping_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.unhappinessdifficultysleeping_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.verysad_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.verysad_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.verysad_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.tearsofsorrow_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.tearsofsorrow_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.tearsofsorrow_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.againstme_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.againstme_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.againstme_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM RDVA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM FCIA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequenciesofresponsestoeat_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALWAYS' THEN 1 WHEN 'OFTEN' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY' THEN 4 WHEN 'NEVER' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequenciesofresponsestoeat_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequenciesofresponsestoeat_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequenciesofresponses_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'RARELY' THEN 1 WHEN 'SOMETIMES' THEN 2 WHEN 'OFTEN' THEN 3 WHEN 'EVERYDAY' THEN 4 ELSE NULL END INTO result;RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequenciesofresponses_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequenciesofresponses_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM QVDA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'EXCELLENT' THEN 1 WHEN 'VERY_GOOD' THEN 2 WHEN 'GOOD' THEN 3 WHEN 'REGULAR' THEN 4 WHEN 'BAD' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'VERY_BETTER_THAN_BEFORE_PREGNACY' THEN 1 WHEN 'A_LITTLE_BETTER_THAN_BEFORE_PREGNACY' THEN 2 WHEN 'ALMOST_THE_SAME' THEN 3 WHEN 'A_LITTLE_WORSE_THAN_BEFORE_PREGNACY' THEN 4 WHEN 'VERY_WORSE_THAN_BEFORE_PREGNACY' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'YES_VERY_DIFFICULTY' THEN 1 WHEN 'YES_A_LITTLE_DIFFICULTY' THEN 2 WHEN 'I_DONT_FEEL_DIFFICULTY' THEN 3 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'GOOD_DEAL_OF_TIME' THEN 3 WHEN 'SOMETIMES' THEN 4 WHEN 'FEW_TIMES' THEN 5 WHEN 'NEVER' THEN 6 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NOT_ONE_BIT' THEN 1 WHEN 'LITTLE_BIT' THEN 2 WHEN 'MODERATELY' THEN 3 WHEN 'ENOUGH' THEN 4 WHEN 'EXTREMELY' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchpaininlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'A_LITTLE_PAIN' THEN 2 WHEN 'LITTLE' THEN 3 WHEN 'MODERATE' THEN 4 WHEN 'A_LOT' THEN 5 WHEN 'UNBEARABLE_PAIN' THEN 6 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofagreement_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'TOTALLY_AGREE' THEN 1 WHEN 'AGREE' THEN 2 WHEN 'NOT_AGREE_AND_NOT_DISAGREE' THEN 3 WHEN 'DISAGREE' THEN 4 WHEN 'TOTALLY_DISAGREE' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofagreement_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofagreement_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM ACEA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.pulsewaist_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'PULSE' THEN 0 WHEN 'WAIST' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.pulsewaist_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.pulsewaist_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM FORA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.whichhand_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'RIGTH' THEN 1 WHEN 'LEFT' THEN 2 WHEN 'BOTH' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.whichhand_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.whichhand_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.wichhandjob_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'RIGTH' THEN 1 WHEN 'LEFT' THEN 2 WHEN 'BOTH_HANDS' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.wichhandjob_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.wichhandjob_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM BIAA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.emptybladder_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.emptybladder_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.emptybladder_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.remembermenstruationdate_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_REMEMBER' THEN 0 WHEN 'NO_MORE_MENSTRUATE' THEN 2 WHEN 'YES_REMEMBER' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.remembermenstruationdate_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.remembermenstruationdate_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM AAFA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM PRDA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.agreedisagree_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'AGREEFULLY' THEN 1 WHEN 'AGREE' THEN 2 WHEN 'DISAGREE' THEN 3 WHEN 'DISAGREEFULLY' THEN 4 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.agreedisagree_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.agreedisagree_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.notagreeordisagree_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'COMPLETELYAGREE' THEN 1 WHEN 'AGREEWITH' THEN 2 WHEN 'NOTAGREENOTDISAGREE' THEN 3 WHEN 'DISAGREEEWITH' THEN 4 WHEN 'DISAGREECOMPLETELY' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.notagreeordisagree_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.notagreeordisagree_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.riskgroup_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'INCREASESTHERISK' THEN 1 WHEN 'DOESNOTCHANCETHERISK' THEN 2 WHEN 'REDUCETHERISK' THEN 3 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.riskgroup_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.riskgroup_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.chanceofhavingdiabetes_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'HALFNOTE' THEN 1 WHEN 'SMALL' THEN 2 WHEN 'REASONABLE' THEN 3 WHEN 'BIG' THEN 4 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.chanceofhavingdiabetes_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.chanceofhavingdiabetes_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM IAPA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.aboutbreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WANT_TO_BREASTFEED' THEN 1 WHEN 'DONT_WANT_DONT_TO_BREASTFEED' THEN 2 WHEN 'IS_IN_DOUBT' THEN 3 WHEN 'IT_CAN_NOT_MEDICAL_REASONS' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.aboutbreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.aboutbreastfeeding_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM IARA ############################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.thinkaboutbreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'AGREE' THEN 1 WHEN 'DISAGREE' THEN 2 WHEN 'NOT_AGREE_NOR_DISAGREE' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.thinkaboutbreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.thinkaboutbreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.breastfeedingintention_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WANT_BREASTFEEDING' THEN 1 WHEN 'DO_NOT_WANT_BREASTFEEDING' THEN 2 WHEN 'AGREE_ARE_IN_DOUBT' THEN 3 WHEN 'MEDICAL_REASONS' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.breastfeedingintention_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.breastfeedingintention_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howbreastfeedthesons_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SUCKLED_WITH_FORMULA' THEN 1 WHEN 'SUCKLED_IN_BREASTS' THEN 2 WHEN 'BOTH_FORMULA_AS_BREAST' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howbreastfeedthesons_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howbreastfeedthesons_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM LAPB ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.goodisyourbaby_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'FINE' THEN 0 WHEN 'WITH_PROBLEMS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.goodisyourbaby_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.goodisyourbaby_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.milkorformula_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'POWDERED_MILK' THEN 1 WHEN 'CHILDISH_FORMULA' THEN 2 WHEN 'OTHER_TYPE' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.milkorformula_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.milkorformula_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.phonecallsaboutproblems_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.phonecallsaboutproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.phonecallsaboutproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stillpregnantwithindicationofdeath_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_BABY_WAS_BORN' THEN 1 WHEN 'NOT_LOST_THE_BABY' THEN 2 WHEN 'YES_IS_PREGNANT' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stillpregnantwithindicationofdeath_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stillpregnantwithindicationofdeath_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typebabyfoodindicatedperiodofbreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONLY_BREAST' THEN 1 WHEN 'BREAST_TEA_OR_WATER' THEN 2 WHEN 'BREAST_MILK_AND_FORMULA' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typebabyfoodindicatedperiodofbreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typebabyfoodindicatedperiodofbreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typebreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'BREASTFEEDING_BREAST' THEN 1 WHEN 'NOT_BREASTFEEDING_BREAST' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typebreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typebreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typechildbed_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NORMAL' THEN 0 WHEN 'CESAREAN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typechildbed_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typechildbed_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM IAEA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.agreeswithministryofhealth_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'AGREE' THEN 1 WHEN 'DISAGREE' THEN 2 WHEN 'NOT_AGREE_NOR_DISAGREE' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.agreeswithministryofhealth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.agreeswithministryofhealth_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.intentionofbreastfeed_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WILL_BREASTFEED' THEN 1 WHEN 'NOT_WANT' THEN 2 WHEN 'IS_IN_DOUBT' THEN 3 WHEN 'MEDICAL_REASON' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.intentionofbreastfeed_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.intentionofbreastfeed_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM ALBA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SINGLE' THEN 0 WHEN 'TWIN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typebreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'BREASTFEEDING_BREAST' THEN 1 WHEN 'NOT_BREASTFEEDING_BREAST' THEN 0 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typebreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typebreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'ONLY_BREAST' THEN 1 WHEN 'BREAST_TEA_OR_WATER' THEN 2 WHEN 'BREAST_MILK_AND_FORMULA' THEN 3 WHEN 'BREAST_AND_OTHER_FOODS' THEN 4 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.whatthebabyisdrinking_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'MILK' THEN 1 WHEN 'BABY_RECIPE' THEN 2 WHEN 'OTHER' THEN 3 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.whatthebabyisdrinking_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.whatthebabyisdrinking_mapping(character varying) TO estatistica;

--###################################################################--
--########################## FORM QVDSA #############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'EXCELLENT' THEN 1 WHEN 'VERY_GOOD' THEN 2 WHEN 'GOOD' THEN 3 WHEN 'REGULAR' THEN 4 WHEN 'BAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERY_BETTER_THAN_BEFORE_PREGNACY' THEN 1 WHEN 'A_LITTLE_BETTER_THAN_BEFORE_PREGNACY' THEN 2 WHEN 'ALMOST_THE_SAME' THEN 3 WHEN 'A_LITTLE_WORSE_THAN_BEFORE_PREGNACY' THEN 4 WHEN 'VERY_WORSE_THAN_BEFORE_PREGNACY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_VERY_DIFFICULTY' THEN 1 WHEN 'YES_A_LITTLE_DIFFICULTY' THEN 2 WHEN 'I_DONT_FEEL_DIFFICULTY' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_ONE_BIT' THEN 1 WHEN 'LITTLE_BIT' THEN 2 WHEN 'MODERATELY' THEN 3 WHEN 'ENOUGH' THEN 4 WHEN 'EXTREMELY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchpaininlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'A_LITTLE_PAIN' THEN 2 WHEN 'LITTLE' THEN 3 WHEN 'MODERATE' THEN 4 WHEN 'A_LOT' THEN 5 WHEN 'UNBEARABLE_PAIN' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'GOOD_DEAL_OF_TIME' THEN 3 WHEN 'SOMETIMES' THEN 4 WHEN 'FEW_TIMES' THEN 5 WHEN 'NEVER' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsocialactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'FEW_TIMES' THEN 4 WHEN 'NEVER' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofagreement_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'TOTALLY_AGREE' THEN 1 WHEN 'AGREE' THEN 2 WHEN 'NOT_AGREE_AND_NOT_DISAGREE' THEN 3 WHEN 'DISAGREE' THEN 4 WHEN 'TOTALLY_DISAGREE' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofagreement_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofagreement_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM RCPSA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercasedontcollecturine_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercasedontcollecturine_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercasedontcollecturine_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM SAUSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM RDVSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM SONSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsleepproblems_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LESSTHANONCE' THEN 2 WHEN 'ONEORTWO' THEN 3 WHEN 'THREEORFOUR' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.difficultyintasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LITTLE' THEN 2 WHEN 'REASONSABLE' THEN 3 WHEN 'GREATDIFFICULTY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.difficultyintasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.difficultyintasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.qualitysleep_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERYGOOD' THEN 1 WHEN 'GOOD' THEN 2 WHEN 'BAD' THEN 3 WHEN 'VERYBAD' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.qualitysleep_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.qualitysleep_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM ALBSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'SINGLE' THEN 0 WHEN 'TWIN' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typebreastfeeding_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'BREASTFEEDING_BREAST' THEN 1 WHEN 'NOT_BREASTFEEDING_BREAST' THEN 0 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typebreastfeeding_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typebreastfeeding_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'ONLY_BREAST' THEN 1 WHEN 'BREAST_TEA_OR_WATER' THEN 2 WHEN 'BREAST_MILK_AND_FORMULA' THEN 3 WHEN 'BREAST_AND_OTHER_FOODS' THEN 4 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typeofbabyfoodwithoutcomments_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.whatthebabyisdrinking_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'MILK' THEN 1 WHEN 'BABY_RECIPE' THEN 2 WHEN 'OTHER' THEN 3 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.whatthebabyisdrinking_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.whatthebabyisdrinking_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM CSCSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM EXASA ###########################--
--###################################################################--

CREATE OR REPLACE VIEW extraction.v_exas_a AS SELECT p.recruitment_number AS numerorecrutamento, a.status AS statusatividade, a.activity_category AS tipoatividade, a.realization_date AS exasadataapini, a.finalization_date AS exasadataapfim, o.date AS exasadataoffline, u.code AS exasaaferidor, ou.code AS exasadigitador, exas_a.EXASA1, extraction.metadata_mapping(exas_a.EXASA1_metadata) AS EXASA1_metadata, exas_a.EXASA1_metadata_comment, exas_a.EXASA1a, extraction.metadata_mapping(exas_a.EXASA1a_metadata) AS EXASA1a_metadata, exas_a.EXASA1a_metadata_comment, exas_a.EXASA1b, extraction.metadata_mapping(exas_a.EXASA1b_metadata) AS EXASA1b_metadata, exas_a.EXASA1b_metadata_comment, exas_a.EXASA1c, extraction.metadata_mapping(exas_a.EXASA1c_metadata) AS EXASA1c_metadata, exas_a.EXASA1c_metadata_comment, exas_a.EXASA2, extraction.metadata_mapping(exas_a.EXASA2_metadata) AS EXASA2_metadata, exas_a.EXASA2_metadata_comment, exas_a.EXASA2a, extraction.metadata_mapping(exas_a.EXASA2a_metadata) AS EXASA2a_metadata, exas_a.EXASA2a_metadata_comment, exas_a.EXASA2b, extraction.metadata_mapping(exas_a.EXASA2b_metadata) AS EXASA2b_metadata, exas_a.EXASA2b_metadata_comment, exas_a.EXASA2c, extraction.metadata_mapping(exas_a.EXASA2c_metadata) AS EXASA2c_metadata, exas_a.EXASA2c_metadata_comment, exas_a.EXASA3, extraction.metadata_mapping(exas_a.EXASA3_metadata) AS EXASA3_metadata, exas_a.EXASA3_metadata_comment, exas_a.EXASA3a, extraction.metadata_mapping(exas_a.EXASA3a_metadata) AS EXASA3a_metadata, exas_a.EXASA3a_metadata_comment, exas_a.EXASA3b, extraction.metadata_mapping(exas_a.EXASA3b_metadata) AS EXASA3b_metadata, exas_a.EXASA3b_metadata_comment, exas_a.EXASA3c, extraction.metadata_mapping(exas_a.EXASA3c_metadata) AS EXASA3c_metadata, exas_a.EXASA3c_metadata_comment, exas_a.EXASA4, extraction.metadata_mapping(exas_a.EXASA4_metadata) AS EXASA4_metadata, exas_a.EXASA4_metadata_comment, exas_a.EXASA4a, extraction.metadata_mapping(exas_a.EXASA4a_metadata) AS EXASA4a_metadata, exas_a.EXASA4a_metadata_comment, exas_a.EXASA4b, extraction.metadata_mapping(exas_a.EXASA4b_metadata) AS EXASA4b_metadata, exas_a.EXASA4b_metadata_comment, exas_a.EXASA4c, extraction.metadata_mapping(exas_a.EXASA4c_metadata) AS EXASA4c_metadata, exas_a.EXASA4c_metadata_comment, exas_a.EXASA5, extraction.metadata_mapping(exas_a.EXASA5_metadata) AS EXASA5_metadata, exas_a.EXASA5_metadata_comment, exas_a.EXASA5a, extraction.metadata_mapping(exas_a.EXASA5a_metadata) AS EXASA5a_metadata, exas_a.EXASA5a_metadata_comment, exas_a.EXASA5b, extraction.metadata_mapping(exas_a.EXASA5b_metadata) AS EXASA5b_metadata, exas_a.EXASA5b_metadata_comment, exas_a.EXASA5c, extraction.metadata_mapping(exas_a.EXASA5c_metadata) AS EXASA5c_metadata, exas_a.EXASA5c_metadata_comment, at.version AS versao_exas FROM coorte.exas_a exas_a JOIN public.activity a ON a.id = exas_a.activity_id JOIN public.activity_type at ON at.id = a.activity_type_id JOIN public.participant p ON p.id = a.participant_id JOIN public."user" u ON u.id = a.user_id LEFT OUTER JOIN public.offline_data_entry o ON o.id = a.offline_data_entry LEFT OUTER JOIN public."user" ou ON ou.id = o.user_id ORDER BY p.recruitment_number;
ALTER TABLE extraction.v_exas_a OWNER TO postgres;
GRANT SELECT ON TABLE extraction.v_exas_a TO estatistica;

--###################################################################--
--############################ FORM TTPSA ###########################--
--###################################################################--

CREATE OR REPLACE VIEW extraction.v_ttps_a AS SELECT p.recruitment_number AS numerorecrutamento, a.status AS statusatividade, a.activity_category AS tipoatividade, a.realization_date AS ttpsadataapini, a.finalization_date AS ttpsadataapfim, o.date AS ttpsadataoffline, u.code AS ttpsaaferidor, ou.code AS ttpsadigitador, ttps_a.TTPSA1, extraction.metadata_mapping(ttps_a.TTPSA1_metadata) AS TTPSA1_metadata, ttps_a.TTPSA1_metadata_comment, ttps_a.TTPSA2a, extraction.metadata_mapping(ttps_a.TTPSA2a_metadata) AS TTPSA2a_metadata, ttps_a.TTPSA2a_metadata_comment, ttps_a.TTPSA2b, extraction.metadata_mapping(ttps_a.TTPSA2b_metadata) AS TTPSA2b_metadata, ttps_a.TTPSA2b_metadata_comment, at.version AS versao_ttps FROM coorte.ttps_a ttps_a JOIN public.activity a ON a.id = ttps_a.activity_id JOIN public.activity_type at ON at.id = a.activity_type_id JOIN public.participant p ON p.id = a.participant_id JOIN public."user" u ON u.id = a.user_id LEFT OUTER JOIN public.offline_data_entry o ON o.id = a.offline_data_entry LEFT OUTER JOIN public."user" ou ON ou.id = o.user_id ORDER BY p.recruitment_number;
ALTER TABLE extraction.v_ttps_a OWNER TO postgres;
GRANT SELECT ON TABLE extraction.v_ttps_a TO estatistica;

--###################################################################--
--############################ FORM CSSSA ###########################--
--###################################################################--

CREATE OR REPLACE VIEW extraction.v_csss_a AS SELECT p.recruitment_number AS numerorecrutamento, a.status AS statusatividade, a.activity_category AS tipoatividade, a.realization_date AS csssadataapini, a.finalization_date AS csssadataapfim, o.date AS csssadataoffline, u.code AS csssaaferidor, ou.code AS csssadigitador, csss_a.CSSSA1ah, csss_a.CSSSA1am, extraction.metadata_mapping(csss_a.CSSSA1a_metadata) AS CSSSA1a_metadata, csss_a.CSSSA1a_metadata_comment, csss_a.CSSSA2a, extraction.metadata_mapping(csss_a.CSSSA2a_metadata) AS CSSSA2a_metadata, csss_a.CSSSA2a_metadata_comment, csss_a.CSSSA2b, extraction.metadata_mapping(csss_a.CSSSA2b_metadata) AS CSSSA2b_metadata, csss_a.CSSSA2b_metadata_comment, csss_a.CSSSA2c, extraction.metadata_mapping(csss_a.CSSSA2c_metadata) AS CSSSA2c_metadata, csss_a.CSSSA2c_metadata_comment, csss_a.CSSSA2d, extraction.metadata_mapping(csss_a.CSSSA2d_metadata) AS CSSSA2d_metadata, csss_a.CSSSA2d_metadata_comment, csss_a.CSSSA2dq, extraction.metadata_mapping(csss_a.CSSSA2dq_metadata) AS CSSSA2dq_metadata, csss_a.CSSSA2dq_metadata_comment, (SELECT code FROM lab.tube WHERE id = csss_a.gelTube_id) AS CSSSA4, extraction.metadata_mapping(csss_a.CSSSA4_metadata) AS CSSSA4_metadata, csss_a.CSSSA4_metadata_comment, (SELECT code FROM lab.tube WHERE id = csss_a.fluorideTube_id) AS CSSSA5, extraction.metadata_mapping(csss_a.CSSSA5_metadata) AS CSSSA5_metadata, csss_a.CSSSA5_metadata_comment, (SELECT code FROM lab.tube WHERE id = csss_a.gelTubeQC_id) AS CSSSA6, extraction.metadata_mapping(csss_a.CSSSA6_metadata) AS CSSSA6_metadata, csss_a.CSSSA6_metadata_comment, at.version AS versao_csss FROM lab.csss_a csss_a JOIN public.activity a ON a.id = csss_a.activity_id JOIN public.activity_type at ON at.id = a.activity_type_id JOIN public.participant p ON p.id = a.participant_id JOIN public."user" u ON u.id = a.user_id LEFT OUTER JOIN public.offline_data_entry o ON o.id = a.offline_data_entry LEFT OUTER JOIN public."user" ou ON ou.id = o.user_id ORDER BY p.recruitment_number;
ALTER TABLE extraction.v_csss_a OWNER TO postgres;
GRANT SELECT ON TABLE extraction.v_csss_a TO estatistica;

--###################################################################--
--############################ FORM AESSA ###########################--
--###################################################################--

CREATE OR REPLACE VIEW extraction.v_aess_a AS SELECT p.recruitment_number AS numerorecrutamento, a.status AS statusatividade, a.activity_category AS tipoatividade, a.realization_date AS aessadataapini, a.finalization_date AS aessadataapfim, o.date AS aessadataoffline, u.code AS aessaaferidor, ou.code AS aessadigitador, (SELECT code FROM lab.tube WHERE id = aess_a.gelSixtyTube_id) AS AESSA1, extraction.metadata_mapping(aess_a.AESSA1_metadata) AS AESSA1_metadata, aess_a.AESSA1_metadata_comment, (SELECT code FROM lab.aliquot WHERE id = aess_a.biochemicalSixtyAliquot_id) AS AESSA2, extraction.metadata_mapping(aess_a.AESSA2_metadata) AS AESSA2_metadata, aess_a.AESSA2_metadata_comment, (SELECT code FROM lab.tube WHERE id = aess_a.fluorideSixtyTube_id) AS AESSA3, extraction.metadata_mapping(aess_a.AESSA3_metadata) AS AESSA3_metadata, aess_a.AESSA3_metadata_comment, (SELECT code FROM lab.aliquot WHERE id = aess_a.glycemiaSixtyAliquot_id) AS AESSA4, extraction.metadata_mapping(aess_a.AESSA4_metadata) AS AESSA4_metadata, aess_a.AESSA4_metadata_comment, (SELECT code FROM lab.tube WHERE id = aess_a.gelSixtyQCTube_id) AS AESSA5, extraction.metadata_mapping(aess_a.AESSA5_metadata) AS AESSA5_metadata, aess_a.AESSA5_metadata_comment, (SELECT code FROM lab.aliquot WHERE id = aess_a.biochemicalSixtyQCAliquot_id) AS AESSA6, extraction.metadata_mapping(aess_a.AESSA6_metadata) AS AESSA6_metadata, aess_a.AESSA6_metadata_comment, at.version AS versao_aess FROM lab.aess_a aess_a JOIN public.activity a ON a.id = aess_a.activity_id JOIN public.activity_type at ON at.id = a.activity_type_id JOIN public.participant p ON p.id = a.participant_id JOIN public."user" u ON u.id = a.user_id LEFT OUTER JOIN public.offline_data_entry o ON o.id = a.offline_data_entry LEFT OUTER JOIN public."user" ou ON ou.id = o.user_id ORDER BY p.recruitment_number;
ALTER TABLE extraction.v_aess_a OWNER TO postgres;
GRANT SELECT ON TABLE extraction.v_aess_a TO estatistica;

--###################################################################--
--############################ FORM EDGSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.moodstate_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_ALWAYS' THEN 1 WHEN 'NOT_ALWAYS' THEN 2 WHEN 'TODAY_LESS' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.moodstate_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.moodstate_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.futurehappiness_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_ALWAYS' THEN 1 WHEN 'NOT_ALWAYS' THEN 2 WHEN 'TODAY_LESS' THEN 3 WHEN 'NOT' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.futurehappiness_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.futurehappiness_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.guiltwithoutreason_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO_WAY' THEN 1 WHEN 'RARELY' THEN 2 WHEN 'SOMETIMES_HAPPENS' THEN 3 WHEN 'YES_OFTENTIMES' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.guiltwithoutreason_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.guiltwithoutreason_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.withanxiety_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_HAPPENS' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.withanxiety_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.withanxiety_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frightenedorpanic_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frightenedorpanic_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frightenedorpanic_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.overloadedwithtasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NOT_HAPPENS' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.overloadedwithtasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.overloadedwithtasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.unhappinessdifficultysleeping_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.unhappinessdifficultysleeping_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.unhappinessdifficultysleeping_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.verysad_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_WAY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.verysad_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.verysad_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.tearsofsorrow_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NO_NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.tearsofsorrow_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.tearsofsorrow_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.againstme_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_HAPPENS' THEN 1 WHEN 'YES_SOMETIMES' THEN 2 WHEN 'SOMETIMES_RARELY' THEN 3 WHEN 'NEVER' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.againstme_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.againstme_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM IMASA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.bodyshapequestions_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONE' THEN 1 WHEN 'TWO' THEN 2 WHEN 'THREE' THEN 3 WHEN 'FOUR' THEN 4 WHEN 'FIVE' THEN 5 WHEN 'SIX' THEN 6 WHEN 'SEVEN' THEN 7 WHEN 'EIGHT' THEN 8 WHEN 'NINE' THEN 9 WHEN 'TEN' THEN 10 WHEN 'ELEVEN' THEN 11 WHEN 'TWELVE' THEN 12 WHEN 'THIRTEEN' THEN 13 WHEN 'FOURTEEN' THEN 14 WHEN 'FIFTEEN' THEN 15 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.bodyshapequestions_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.bodyshapequestions_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM DMPA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM CAPA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.howoftenthebabyatelikethis_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'LESS_THAN_ONCE_TIME_A_WEEK' THEN 2 WHEN 'ONCE_TIME_A_WEEK' THEN 3 WHEN 'TWO_TIME_OR_MORE_A_WEEK' THEN 4 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howoftenthebabyatelikethis_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howoftenthebabyatelikethis_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM DGCA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.howmanytimes_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'LESS_THE_ONE_WEEK' THEN 2 WHEN 'ONE_WEEK' THEN 3 WHEN 'TWO_OR_MORE' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmanytimes_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmanytimes_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM OUAA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM LSMA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesnowithlabel_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnowithlabel_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnowithlabel_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.methodtoavoidpregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'LIGADURA' THEN 2 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.methodtoavoidpregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.methodtoavoidpregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.dayperiod_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'LUNCH' THEN 1 WHEN 'DINNER' THEN 2 WHEN 'LUNCH_DINNER' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.dayperiod_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.dayperiod_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.resulexam_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.resulexam_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.resulexam_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.chickenskin_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WITH_SKIN' THEN 1 WHEN 'WITHOUT_SKIN' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.chickenskin_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.chickenskin_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.lostbaby_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES_DIED' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.lostbaby_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.lostbaby_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'UNIQUE' THEN 0 WHEN 'TWINS' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM ALHSA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.innormaldaysdoyoueatthistypeoffood_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ONLY_AT_LUNCH' THEN 1 WHEN 'ONLY_AT_DINNER' THEN 2 WHEN 'AT_LUNCH_AND_DINNER' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.innormaldaysdoyoueatthistypeoffood_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.innormaldaysdoyoueatthistypeoffood_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.chickenpreparing_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'WITH_FUR' THEN 1 WHEN 'WITHOUT_FUR' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.chickenpreparing_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.chickenpreparing_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM AGEA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.loseweightorpreventweightgainchoicegroup_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'AVOID_GAIN' THEN 0 WHEN 'LOSE_WEIGHT' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.loseweightorpreventweightgainchoicegroup_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.loseweightorpreventweightgainchoicegroup_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.periodrealizationexams_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'CAN_NOT' THEN 0 WHEN 'AVAILABLE' THEN 1 WHEN 'ANOTHER_REASON' THEN 2 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.periodrealizationexams_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.periodrealizationexams_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM MECA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesdoubt_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'DOUBT' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesdoubt_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesdoubt_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM LUAA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.methodtopreventpregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'LIGADURA' THEN 2 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.methodtopreventpregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.methodtopreventpregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.gettheresult_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'YES_SAY' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.gettheresult_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.gettheresult_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM LDAA ############################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesdeath_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesdeath_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesdeath_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesgetinformationno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesgetinformationno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesgetinformationno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SINGLE' THEN 0 WHEN 'TWIN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM QVDUA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'EXCELLENT' THEN 1 WHEN 'VERY_GOOD' THEN 2 WHEN 'GOOD' THEN 3 WHEN 'REGULAR' THEN 4 WHEN 'BAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERY_BETTER_THAN_BEFORE_PREGNACY' THEN 1 WHEN 'A_LITTLE_BETTER_THAN_BEFORE_PREGNACY' THEN 2 WHEN 'ALMOST_THE_SAME' THEN 3 WHEN 'A_LITTLE_WORSE_THAN_BEFORE_PREGNACY' THEN 4 WHEN 'VERY_WORSE_THAN_BEFORE_PREGNACY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_VERY_DIFFICULTY' THEN 1 WHEN 'YES_A_LITTLE_DIFFICULTY' THEN 2 WHEN 'I_DONT_FEEL_DIFFICULTY' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'GOOD_DEAL_OF_TIME' THEN 3 WHEN 'SOMETIMES' THEN 4 WHEN 'FEW_TIMES' THEN 5 WHEN 'NEVER' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsocialactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'FEW_TIMES' THEN 4 WHEN 'NEVER' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_ONE_BIT' THEN 1 WHEN 'LITTLE_BIT' THEN 2 WHEN 'MODERATELY' THEN 3 WHEN 'ENOUGH' THEN 4 WHEN 'EXTREMELY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchpaininlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'A_LITTLE_PAIN' THEN 2 WHEN 'LITTLE' THEN 3 WHEN 'MODERATE' THEN 4 WHEN 'A_LOT' THEN 5 WHEN 'UNBEARABLE_PAIN' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofagreement_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'TOTALLY_AGREE' THEN 1 WHEN 'AGREE' THEN 2 WHEN 'NOT_AGREE_AND_NOT_DISAGREE' THEN 3 WHEN 'DISAGREE' THEN 4 WHEN 'TOTALLY_DISAGREE' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofagreement_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofagreement_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM RCPUA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercasedontcolecturine_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM SAUUA ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.methodofavoidpregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'LIGADURA' THEN 2 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.methodofavoidpregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.methodofavoidpregnancy_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM MAIA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'PARTICIPANTSTILLBREASTFEEDING_NO' THEN 0 WHEN 'PARTICIPANTSTILLBREASTFEEDING_YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.losemoreweigth_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES_RECORD_QUESTION' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.losemoreweigth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.losemoreweigth_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM AAFUA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM FORUA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.whichhand_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'RIGTH' THEN 1 WHEN 'LEFT' THEN 2 WHEN 'BOTH' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.whichhand_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.whichhand_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.wichhandjob_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'RIGTH' THEN 1 WHEN 'LEFT' THEN 2 WHEN 'BOTH_HANDS' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.wichhandjob_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.wichhandjob_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM RDVUA  ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM SONUA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsleepproblems_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LESSTHANONCE' THEN 2 WHEN 'ONEORTWO' THEN 3 WHEN 'THREEORFOUR' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.difficultyintasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LITTLE' THEN 2 WHEN 'REASONUABLE' THEN 3 WHEN 'GREATDIFFICULTY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.difficultyintasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.difficultyintasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.qualitysleep_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERYGOOD' THEN 1 WHEN 'GOOD' THEN 2 WHEN 'BAD' THEN 3 WHEN 'VERYBAD' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.qualitysleep_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.qualitysleep_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM MAIB  ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'PARTICIPANTSTILLBREASTFEEDING_NO' THEN 0 WHEN 'PARTICIPANTSTILLBREASTFEEDING_YES' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.participantstillbreastfeedingyesorno_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.losemoreweigth_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES_RECORD_QUESTION' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.losemoreweigth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.losemoreweigth_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM FBBUA  ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.typepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'SINGLE' THEN 0 WHEN 'TWIN' THEN 1 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.typepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.typepregnancy_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM CSCD  ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesno_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesno_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesno_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM QVDDA ###########################--
--###################################################################--
CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'EXCELLENT' THEN 1 WHEN 'VERY_GOOD' THEN 2 WHEN 'GOOD' THEN 3 WHEN 'REGULAR' THEN 4 WHEN 'BAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedtootherpeople_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERY_BETTER_THAN_BEFORE_PREGNACY' THEN 1 WHEN 'A_LITTLE_BETTER_THAN_BEFORE_PREGNACY' THEN 2 WHEN 'ALMOST_THE_SAME' THEN 3 WHEN 'A_LITTLE_WORSE_THAN_BEFORE_PREGNACY' THEN 4 WHEN 'VERY_WORSE_THAN_BEFORE_PREGNACY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.stateofhealthcomparedwithstatusbeforeofthepregnancy_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES_VERY_DIFFICULTY' THEN 1 WHEN 'YES_A_LITTLE_DIFFICULTY' THEN 2 WHEN 'I_DONT_FEEL_DIFFICULTY' THEN 3 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofdifficultytodosomeactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'GOOD_DEAL_OF_TIME' THEN 3 WHEN 'SOMETIMES' THEN 4 WHEN 'FEW_TIMES' THEN 5 WHEN 'NEVER' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchtimeinlastfourweekscharacteristics_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsocialactivities_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALL_TIME' THEN 1 WHEN 'MOST_OF_THE_TIME' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'FEW_TIMES' THEN 4 WHEN 'NEVER' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsocialactivities_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_ONE_BIT' THEN 1 WHEN 'LITTLE_BIT' THEN 2 WHEN 'MODERATELY' THEN 3 WHEN 'ENOUGH' THEN 4 WHEN 'EXTREMELY' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchaffectedyourhealthphysicaloremotionalinlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howmuchpaininlastfourweeks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NEVER' THEN 1 WHEN 'A_LITTLE_PAIN' THEN 2 WHEN 'LITTLE' THEN 3 WHEN 'MODERATE' THEN 4 WHEN 'A_LOT' THEN 5 WHEN 'UNBEARABLE_PAIN' THEN 6 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howmuchpaininlastfourweeks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.levelofagreement_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'TOTALLY_AGREE' THEN 1 WHEN 'AGREE' THEN 2 WHEN 'NOT_AGREE_AND_NOT_DISAGREE' THEN 3 WHEN 'DISAGREE' THEN 4 WHEN 'TOTALLY_DISAGREE' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.levelofagreement_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.levelofagreement_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM BIADA  ##########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.emptybladder_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.emptybladder_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.emptybladder_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.remembermenstruationdate_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT_REMEMBER' THEN 0 WHEN 'NO_MORE_MENSTRUATE' THEN 2 WHEN 'YES_REMEMBER' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.remembermenstruationdate_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.remembermenstruationdate_mapping(character varying) TO estatistica;


--###################################################################--
--############################ FORM SONDA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.yesnouppercasecorrectposition_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'YES' THEN 1 WHEN 'NO' THEN 0 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.yesnouppercasecorrectposition_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.frequencyofsleepproblems_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LESSTHANONCE' THEN 2 WHEN 'ONEORTWO' THEN 3 WHEN 'THREEORFOUR' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.frequencyofsleepproblems_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.difficultyintasks_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'NOT' THEN 1 WHEN 'LITTLE' THEN 2 WHEN 'REASONDABLE' THEN 3 WHEN 'GREATDIFFICULTY' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.difficultyintasks_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.difficultyintasks_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.qualitysleep_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'VERYGOOD' THEN 1 WHEN 'GOOD' THEN 2 WHEN 'BAD' THEN 3 WHEN 'VERYBAD' THEN 4 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.qualitysleep_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.qualitysleep_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercase_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercase_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercase_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.noyesuppercasedontcolecturine_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying;BEGIN SELECT CASE value WHEN 'NO' THEN 0 WHEN 'YES' THEN 1 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.noyesuppercasedontcolecturine_mapping(character varying) TO estatistica;

--###################################################################--
--############################ FORM HABDA  ###########################--
--###################################################################--

CREATE OR REPLACE FUNCTION extraction.howoftendidyoufeedinthelastmonth_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'MORE_THAN_ONCE_A_DAY' THEN 1 WHEN 'ONCE_A_DAY' THEN 2 WHEN 'FOUR_TO_SIX_TIMES_PER_WEEK' THEN 3 WHEN 'TWICE_TO_THREE_TIMES_A_WEEK' THEN 4 WHEN 'ONCE_A_WEEK' THEN 5 WHEN 'RARELY' THEN 6 WHEN 'NEVER' THEN 7 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howoftendidyoufeedinthelastmonth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howoftendidyoufeedinthelastmonth_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonth_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonth_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonth_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcake_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_CAKE' THEN 5 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcake_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcake_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatchicken_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_CHICKEN' THEN 5 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatchicken_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatchicken_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbeef_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_BEEF' THEN 5 ELSE NULL END INTO result;RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbeef_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbeef_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatpotato_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_POTATO' THEN 5 ELSE NULL END INTO result; RETURN result;END;$BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatpotato_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatpotato_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatfish_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_FISH' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatfish_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatfish_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbread_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_BREAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbread_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatbread_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_DESSERT' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert2_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_DESSERT2' THEN 5 ELSE NULL END INTO result; RETURN result;END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert2_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatdessert2_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatvegetableandveggies_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_VEGETABLE' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatvegetableandveggies_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatvegetableandveggies_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcookedvegetableandveggies_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DONT_EAT_COOKED_VEGETABLE' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcookedvegetableandveggies_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdonteatcookedvegetableandveggies_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdidntcoverthebread_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'ALMOST_OR_ALMOST_ALWAYS' THEN 1 WHEN 'OFTENTIMES' THEN 2 WHEN 'SOMETIMES' THEN 3 WHEN 'RARELY_OR_NEVER' THEN 4 WHEN 'DID_NOT_COVER_THE_BREAD' THEN 5 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdidntcoverthebread_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.howintensehaveyoufeedinthelastmonthwithdidntcoverthebread_mapping(character varying) TO estatistica;

CREATE OR REPLACE FUNCTION extraction.spoontype_mapping(value character varying) RETURNS int AS $BODY$ DECLARE result character varying; BEGIN SELECT CASE value WHEN 'TEA' THEN 1 WHEN 'DESSERT' THEN 2 ELSE NULL END INTO result; RETURN result; END; $BODY$ LANGUAGE 'plpgsql';
ALTER FUNCTION extraction.spoontype_mapping(character varying) OWNER TO postgres;
GRANT EXECUTE ON FUNCTION extraction.spoontype_mapping(character varying) TO estatistica;
