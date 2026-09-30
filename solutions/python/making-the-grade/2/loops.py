"""Functions for organizing and calculating student exam scores."""


def round_scores(student_scores: list[float]) -> list[int]:
    """Round all provided student scores.

    Parameters:
        student_scores (list[float]): Student exam scores.

    Returns:
        list[int]: Student scores *rounded* to the nearest integer value.
    """

    for idx, student in enumerate(student_scores):
        student_scores[idx] = round(student)
    return student_scores


def count_failed_students(student_scores: list[int]) -> int:
    """Count the number of failing students out of the group provided.

    Parameters:
        student_scores (list[int]): Student scores as ints.

    Returns:
        int: The count of student scores at or below 40.
    """

    failed_cnt: int = 0

    for score in student_scores:
        if score <= 40: failed_cnt += 1

    return failed_cnt


def above_threshold(student_scores: list[int], threshold: int) -> list[int]:
    """Determine how many of the provided student scores were 'the best' based on the provided threshold.

    Parameters:
        student_scores (list[int]): Integer scores.
        threshold (int): The threshold to cross to be the "best" score.

    Returns:
        list[int]: Integer scores that are at or above the "best" threshold.
    """

    # isnt 'best' max? this is more like a pass?

    ret: list[int] = []

    for score in student_scores:
        if score >= threshold: ret.append(score)

    return ret


def letter_grades(highest: int) -> list[int]:
    """Create a list of grade thresholds based on the provided highest grade.

    Parameters:
        highest (int): The value of the highest exam score.

    Returns:
        list[int]: Lower threshold scores for each D-A letter grade interval.

        For example, where the highest score is 100, and failing is <= 40,
        The result would be [41, 56, 71, 86]:
            41 <= "D" <= 55
            56 <= "C" <= 70
            71 <= "B" <= 85
            86 <= "A" <= 100
    """

    lowbar: int = 40

    increment: int = (highest - lowbar) // 4

    return [
        lowbar+1,lowbar+1+increment,lowbar+1+increment+increment,
        lowbar+1+increment+increment+increment
           ]


def student_ranking(student_scores: list[int], student_names: list[str]) -> list[str]:
    """Organize the student's rank, name, and grade information in descending order.

    Parameters:
        student_scores (list): Scores in descending order.
        student_names (list[str]): Student names by exam score in descending order.

    Returns:
        list[str]: Strings in format ["<rank>. <student name>: <score>"].
    """

    # assuming the lists are of the same length

    ret: list[str] = []

    for idx, score in enumerate(student_scores):
        rank: int = idx+1
        entry: str = "".join((str(rank),". ",student_names[idx],": ",str(score)))
        ret.append(entry)

    return ret


def perfect_score(student_info: list[list[str, int]]) -> list[str,int]:
    """Create a list that contains the name and grade of the first student to make a perfect score on the exam.

    Parameters:
        student_info (list[list[str, int]]): List of [<student name>, <score>] lists.

    Returns:
        list: First `[<student name>, 100]` found OR `[]` if no student score of 100 is found.
    """

    for info in student_info:
        if info[1] == 100:
            return info
    return []
    
