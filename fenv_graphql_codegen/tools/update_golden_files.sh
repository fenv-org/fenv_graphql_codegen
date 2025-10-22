#!/usr/bin/env bash

# Script to update golden files for blog_platform_test integration tests
# This script copies generated *.myapp.dart and *.myapp.mocks.dart files
# from the test package to the golden reference directory

set -euo pipefail

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # No Color

# Get the script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Define paths
readonly TEST_PACKAGE_DIR="${PROJECT_ROOT}/test/integration/test_packages/blog_platform_test"
readonly GOLDEN_DIR="${TEST_PACKAGE_DIR}/golden"

# Counters
cleaned_count=0
updated_count=0

# Print colored message
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verify directories exist
verify_directories() {
    if [[ ! -d "${TEST_PACKAGE_DIR}" ]]; then
        print_error "Test package directory not found: ${TEST_PACKAGE_DIR}"
        exit 1
    fi

    if [[ ! -d "${GOLDEN_DIR}" ]]; then
        print_info "Creating golden directory: ${GOLDEN_DIR}"
        mkdir -p "${GOLDEN_DIR}"
    fi
}

# Clean up existing golden files
cleanup_golden_files() {
    print_info "Cleaning up existing golden files..."

    # Find and remove *.myapp.dart files
    while IFS= read -r -d '' file; do
        rm -f "${file}"
        ((cleaned_count++))
    done < <(find "${GOLDEN_DIR}" -type f -name "*.myapp.dart" -print0 2>/dev/null || true)

    # Find and remove *.myapp.mocks.dart files
    while IFS= read -r -d '' file; do
        rm -f "${file}"
        ((cleaned_count++))
    done < <(find "${GOLDEN_DIR}" -type f -name "*.myapp.mocks.dart" -print0 2>/dev/null || true)

    print_info "Cleaned up ${cleaned_count} golden files"
}

# Copy generated files to golden directory
copy_files() {
    local source_dir="$1"
    local pattern="$2"
    local base_subdir="$3"  # "lib" or "test"

    # Find all files matching the pattern
    while IFS= read -r -d '' source_file; do
        # Get relative path from source_dir
        local rel_path="${source_file#"${source_dir}"/}"

        # Construct destination path with base_subdir preserved
        local dest_file="${GOLDEN_DIR}/${base_subdir}/${rel_path}"
        local dest_dir
        dest_dir="$(dirname "${dest_file}")"

        # Create destination directory if it doesn't exist
        mkdir -p "${dest_dir}"

        # Copy the file
        cp "${source_file}" "${dest_file}"
        ((updated_count++))

        # Print relative path for clarity
        print_info "Updated: ${base_subdir}/${rel_path}"
    done < <(find "${source_dir}" -type f -name "${pattern}" -print0 2>/dev/null || true)
}

# Main execution
main() {
    print_info "Starting golden file update..."
    print_info "Test package: ${TEST_PACKAGE_DIR}"
    print_info "Golden directory: ${GOLDEN_DIR}"
    echo ""

    # Verify directories
    verify_directories

    # Clean up existing golden files
    cleanup_golden_files
    echo ""

    # Copy *.myapp.dart files from lib/
    print_info "Copying *.myapp.dart files from lib/..."
    copy_files "${TEST_PACKAGE_DIR}/lib" "*.myapp.dart" "lib"

    # Copy *.myapp.mocks.dart files from test/
    print_info "Copying *.myapp.mocks.dart files from test/..."
    copy_files "${TEST_PACKAGE_DIR}/test" "*.myapp.mocks.dart" "test"

    echo ""
    print_info "Done!"
    print_info "Summary: Cleaned ${cleaned_count} files, updated ${updated_count} files"

    if [[ ${updated_count} -eq 0 ]]; then
        print_warn "No files were updated. Make sure build_runner has generated the files first."
        exit 1
    fi
}

# Run main function
main
