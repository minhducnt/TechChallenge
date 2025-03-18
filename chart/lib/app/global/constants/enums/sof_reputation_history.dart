enum SofReputationHistory {
  asker_accepts_answer,
  asker_unaccept_answer,
  answer_accepted,
  answer_unaccepted,
  voter_downvotes,
  voter_undownvotes,
  post_downvoted,
  post_undownvoted,
  post_upvoted,
  post_unupvoted,
  suggested_edit_approval_received,
  post_flagged_as_spam,
  post_flagged_as_offensive,
  bounty_given,
  bounty_earned,
  bounty_cancelled,
  post_deleted,
  post_undeleted,
  association_bonus,
  arbitrary_reputation_change,
  vote_fraud_reversal,
  post_migrated,
  user_deleted,
  example_upvoted,
  example_unupvoted,
  proposed_change_approved,
  doc_link_upvoted,
  doc_link_unupvoted,
  doc_source_removed,
  suggested_edit_approval_overridden,
}

extension SofReputationHistoryHelper on SofReputationHistory {
  static String toSentenceCase(String history) {
    String sentenceCase(String input) {
      if (input.isEmpty) return input;
      return input.replaceAllMapped(
        RegExp(r'(^\w)|(_\w)'),
        (match) => match.group(0)!.replaceAll('_', ' ').toUpperCase(),
      );
    }

    return sentenceCase(
      SofReputationHistory.values.firstWhere((e) => e.name == history).name,
    );
  }
}
