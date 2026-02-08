class AssetItem {
  const AssetItem({
    required this.assetName,
    required this.serial,
    required this.assignedTo,
    required this.status,
  });

  final String assetName;
  final String serial;
  final String assignedTo;
  final String status;
}
