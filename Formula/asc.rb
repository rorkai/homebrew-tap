# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.5.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.5.0/asc_5.5.0_macOS_arm64'
      sha256 '8d0c38ad9c7e3094d2fc9b7b5a86d7c9a08fd2b36a3df081aefbf60503035b29'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.5.0/asc_5.5.0_macOS_amd64'
      sha256 '296553af9cd63f9f93782f22dc12077c3d6678ee57cf52e05aee7e850fe13f63'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
